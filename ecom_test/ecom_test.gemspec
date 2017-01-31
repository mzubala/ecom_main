# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ecom_test/version'

Gem::Specification.new do |spec|
  spec.name          = "ecom_test"
  spec.version       = EcomTest::VERSION
  spec.authors       = ["Maciej Zubala"]
  spec.email         = ["maciej.zubala@gmail.com"]

  spec.summary       = %q{Ecom test}
  spec.description   = %q{Ecom test}

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end


  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber", "~> 2.4.0"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "selenium-webdriver", "~> 2.53.0"
  spec.add_development_dependency "activesupport", "~> 4.2.6"
  spec.add_development_dependency "faraday", "~> 0.11.0"
  spec.add_development_dependency "require_all"
end
