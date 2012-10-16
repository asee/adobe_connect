# encoding: utf-8
require File.expand_path('../lib/adobe_connect/version', __FILE__)

Gem::Specification.new do |spec|
  spec.authors = ["Kunmi Ayanbule"]
  spec.description = %q{A Ruby interface to the Adobe Connect API.}
  spec.summary = %Q{A Ruby interface to the Adobe Connect API.}
  spec.email = "ayanbule@gmail.com"
  spec.files = %w(CHANGELOG.md LICENSE.md README.md Rakefile adobe_connect.gemspec)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.files += Dir.glob("spec/**/*")
  spec.homepage = 'https://github.com/ayanbule/adobe_connect'
  spec.name = 'adobe_connect'
  spec.license = "MIT"
  spec.require_paths = ['lib']
  spec.add_dependency 'faraday', '~> 0.8'
  spec.add_dependency 'faraday_middleware', '~> 0.8'
  spec.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  spec.version = AdobeConnect::Version
end
