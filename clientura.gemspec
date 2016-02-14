# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: clientura 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "clientura"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Vlad Shmyhlo"]
  s.date = "2016-02-14"
  s.description = "TODO: longer description of your gem"
  s.email = "aion.stu@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "LICENSE.txt",
    "README.md",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".rubocop.yml",
    ".ruby-gemset",
    ".ruby-version",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "LICENSE.txt",
    "README.md",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "clientura.gemspec",
    "lib/clientura.rb",
    "lib/clientura/client.rb",
    "lib/clientura/client/endpoint.rb",
    "lib/clientura/client/middleware_function_context.rb",
    "lib/clientura/client/request.rb",
    "lib/clientura/raising_promise.rb",
    "lib/clientura/version.rb",
    "spec/clientura/client_spec.rb",
    "spec/clientura_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/test_server.rb"
  ]
  s.homepage = "http://github.com/v-shmyhlo/clientura"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "TODO: one-line summary of your gem"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<http>, ["~> 1.0"])
      s.add_runtime_dependency(%q<concurrent-ruby>, ["~> 1.0"])
      s.add_runtime_dependency(%q<concurrent-ruby-edge>, ["~> 0.2"])
      s.add_runtime_dependency(%q<concurrent-ruby-ext>, ["~> 1.0"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 4.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<rubocop>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<sinatra>, [">= 0"])
      s.add_development_dependency(%q<sinatra-contrib>, [">= 0"])
      s.add_development_dependency(%q<rack>, [">= 0"])
    else
      s.add_dependency(%q<http>, ["~> 1.0"])
      s.add_dependency(%q<concurrent-ruby>, ["~> 1.0"])
      s.add_dependency(%q<concurrent-ruby-edge>, ["~> 0.2"])
      s.add_dependency(%q<concurrent-ruby-ext>, ["~> 1.0"])
      s.add_dependency(%q<activesupport>, ["~> 4.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<rubocop>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<sinatra-contrib>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
    end
  else
    s.add_dependency(%q<http>, ["~> 1.0"])
    s.add_dependency(%q<concurrent-ruby>, ["~> 1.0"])
    s.add_dependency(%q<concurrent-ruby-edge>, ["~> 0.2"])
    s.add_dependency(%q<concurrent-ruby-ext>, ["~> 1.0"])
    s.add_dependency(%q<activesupport>, ["~> 4.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<rubocop>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<sinatra-contrib>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
  end
end

