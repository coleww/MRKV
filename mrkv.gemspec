# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mrkv/version'

Gem::Specification.new do |spec|
  spec.name          = "mrkv"
  spec.version       = Mrkv::VERSION
  spec.authors       = ["Cole Willsea"]
  spec.email         = ["coleww@gmail.com"]
  spec.summary       = %q{it is a markov chain. it generates silly text.}
  spec.description   = %q{given an array of source lines, builds a markov chain and generates random sentences.}
  spec.homepage      = "https://github.com/coleww/mrkv"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'test_construct'
  spec.add_development_dependency "minitest"
end
