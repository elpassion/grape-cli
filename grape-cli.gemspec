# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "grape-cli"
  spec.version       = Grape::Cli::VERSION
  spec.authors       = ["wswidzinski", "michalwarda", "koszcz", "ghostbuster91"]
  spec.email         = ["swidzinskiw@gmail.com"]

  spec.summary       = %q{ Grape-CLI is a gem for bootstraping standalone Grape application. }
  spec.description   = %q{ Grape-CLI is a gem for bootstraping standalone Grape application. It is heavily inspired by Rails/Ember generators. }
  spec.homepage      = "http://github.com/elpassion/grape-cli"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["grape"]
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "bundler", "~> 1.10"
  spec.add_dependency "racksh"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
end
