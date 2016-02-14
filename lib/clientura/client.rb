require 'clientura/client/request'
require 'clientura/client/endpoint'
require 'clientura/client/middleware_function_context'

module Clientura
  module Client
    def self.included(klass)
      klass.extend ClassMethods
      klass.include InstanceMethods
    end

    module ClassMethods
      def registered_endpoints
        @registered_endpoints ||= {}
      end

      def registered_pipes
        @registered_pipes ||= {}
      end

      def registered_middleware
        @registered_middleware ||= {}
      end

      def get(name, path: nil)
        register_endpoint(name, verb: :get, path: path || name.to_s)
      end

      def post(name, path: nil)
        register_endpoint(name, verb: :post, path: path || name.to_s)
      end

      def register_endpoint(name, verb:, path:)
        registered_endpoints[name] = Endpoint.new verb,
                                                  path,
                                                  [*@middleware_context],
                                                  [*@pipes_context]

        define_method "#{name}_promise" do |**args|
          call_endpoint(name, args)
        end

        define_method name do |**args|
          send("#{name}_promise", args).value
        end
      end

      def pipe(name, callable)
        registered_pipes[name] = callable
      end

      def middleware(name, callable)
        registered_middleware[name] = callable
      end

      def aggregator(name, &block)
        define_method "#{name}_promise" do |*args|
          RaisingPromise.new { instance_exec(*args, &block) }.execute
        end

        define_method name do |*args|
          send("#{name}_promise", *args).value
        end
      end

      def pipe_through(*pipes)
        @pipes_context ||= []
        @pipes_context.push(*pipes)
        yield
        @pipes_context.pop pipes.count
      end

      def use_middleware(*middleware)
        @middleware_context ||= []
        @middleware_context.push(*middleware)
        yield
        @middleware_context.pop middleware.count
      end
    end

    module InstanceMethods
      def self.included(klass)
        define_method :registered_endpoints do
          klass.registered_endpoints
        end

        define_method :registered_pipes do
          klass.registered_pipes
        end

        define_method :registered_middleware do
          klass.registered_middleware
        end
      end

      attr_writer :config

      def config
        @config ||= {}
      end

      def save_config(**args)
        self.config = config.merge args
      end

      def call_endpoint(name, **args)
        endpoint = registered_endpoints.fetch(name)

        path = if endpoint.path.respond_to?(:call)
                 endpoint.path.call(args)
               else
                 endpoint.path
               end

        # promise = Concurrent::Promise.execute { Request.new }
        promise = RaisingPromise.new { Request.new }.execute

        promise = endpoint.middleware.map do |middleware|
          case middleware
          when Array
            name, *config = middleware

            { callable: registered_middleware.fetch(name),
              config: config }
          else
            { callable: registered_middleware.fetch(middleware),
              config: [] }
          end
        end.reduce promise do |http_, callable:, config:|
          http_.then do |http__|
            middleware = MiddlewareFunctionContext.new(request: http__,
                                                       client: self,
                                                       args: args,
                                                       callable: callable,
                                                       config: config)
            middleware.call
          end
        end

        promise = promise.then do |http|
          http.send(endpoint.verb, path)
        end

        endpoint.pipes.map do |pipe|
          case pipe
          when Array
            name, *config = pipe
            -> (res) { registered_pipes.fetch(name).call(res, *config) }
          else
            registered_pipes.fetch pipe
          end
        end.reduce promise do |promise_, pipe|
          promise_.then(&pipe)
        end
      end
    end
  end
end
