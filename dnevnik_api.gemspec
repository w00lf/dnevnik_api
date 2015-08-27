# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dnevnik_api/version'

Gem::Specification.new do |spec|
  spec.name          = "dnevnik_api"
  spec.version       = DnevnikApi::VERSION
  spec.authors       = ["Taraskin Mikhail"]
  spec.email         = ["roberar2ua@gmail.com"]
  spec.summary       = %q{ Ruby wrapper for Dnevnik API }
  spec.description   = %q{ Ruby wrapper around Dnevnik API - https://api.dnevnik.ru/, supports simple api calls }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 1.9.2'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_runtime_dependency 'faraday',                     '~> 0.9.0'
  spec.add_runtime_dependency 'faraday_middleware',          '~> 0.9.1'
  spec.add_runtime_dependency 'faraday_middleware-parse_oj', '~> 0.3'
  spec.add_runtime_dependency 'hashie',                      '~> 2.0'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'mechanize', '~> 2.7'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'awesome_print', '~> 1.2'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug", '~> 3.5'
end