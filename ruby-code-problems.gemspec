# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby/code/problems/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-code-problems"
  spec.version       = Ruby::Code::Problems::VERSION
  spec.authors       = ["Claire Tran"]
  spec.email         = ["c.tran83@gmail.com"]
  spec.summary       = %q{Coding problems in Ruby}
  spec.description   = %q{Coding problems in Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
end
