# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'password_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "password-generator"
  spec.version       = Password_Generator::VERSION
  spec.authors       = ["Matthew Robinson"]
  spec.email         = ["matthew.robinson@ensighten.com"]

  spec.summary       = %q{Password generator from custom character sets.}
  spec.description   = %q{A password generator to help build passwords
    that meet complexity requirements from most websites.}
  spec.homepage      = "http://github.com/mlrobinson/password-generator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
