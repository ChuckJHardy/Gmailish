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

  spec.add_dependency "mail"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-fire"
  spec.add_development_dependency "simplecov"
end
