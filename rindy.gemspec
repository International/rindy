# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rindy/version'

Gem::Specification.new do |spec|
  spec.name          = "rindy"
  spec.version       = Rindy::VERSION
  spec.authors       = ["George Opritescu"]
  spec.email         = ["ssscripting@gmail.com"]
  spec.summary       = %q{Ruby Unity Indicator}
  spec.description   = %q{Ruby Unity Indicator}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'ruby-libappindicator'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "pry-doc"
  spec.add_development_dependency "pry-stack_explorer"
  spec.add_development_dependency "pry-coolline"
  spec.add_development_dependency "pry-macro"
end
