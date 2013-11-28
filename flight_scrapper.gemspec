# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flight_scrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "flight_scrapper"
  spec.version       = FlightScrapper::VERSION
  spec.authors       = ["Martí Serra"]
  spec.email         = ["marti.serra.alabau@gmail.com"]
  spec.description   = %q{Scrapper for Flight Availability and Prices}
  spec.summary       = %q{Flight Suppliers included in this gem: Easyjet}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "mechanize", "~> 2.7"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'factory_girl',  "~> 4.0"
end
