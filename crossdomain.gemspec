# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crossdomain/version'

Gem::Specification.new do |spec|
  spec.name          = "crossdomain"
  spec.version       = Crossdomain::VERSION
  spec.authors       = ["Alexander Dimitrov"]
  spec.email         = ["dimitrov@loggator.com"]
  spec.description   = %q{Daemon to serve crossdomain.xml on the flashport}
  spec.summary       = %q{crossdomain.xml flashsocket daemon}
  spec.homepage      = "https://loggator.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'activesupport',    '~> 3.1'
end
