# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gmailish/version'

Gem::Specification.new do |spec|
  spec.name          = "gmailish"
  spec.version       = Gmailish::VERSION
  spec.authors       = ["Charles J Hardy"]
  spec.email         = ["chuckjhardy@gmail.com"]
  spec.description   = %q{Grabs unread emails for Gmail, marks them as read, applies a given label and archives them.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/ChuckJHardy/Gmailish"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mail", "~> 2.5.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13.0"
  spec.add_development_dependency "rspec-fire", "~> 1.1.3"
  spec.add_development_dependency "simplecov", "~> 0.7.1"
  spec.add_development_dependency "simplecov-vim", "~> 0.0.1"
end
