# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ttrakker/version'

Gem::Specification.new do |spec|
  spec.name          = "ttrakker"
  spec.version       = Ttrakker::VERSION
  spec.authors       = ["Benjamin Pearce"]
  spec.email         = ["hawk.git@bcpearce.com\n"]
  spec.summary       = "Provides interface for scraping data from Amtrak.com"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "mechanize"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
end
