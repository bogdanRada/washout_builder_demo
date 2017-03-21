# Encoding: UTF-8
require 'date'
require File.expand_path("../lib/namespace/my_engine2/version", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'namespace-my_engine2'
  s.version     = Namespace::MyEngine2.gem_version
  s.summary     = 'Testing engine for wash out soap service'
  s.description = s.summary
  s.platform    = Gem::Platform::RUBY
  s.email       = "raoul_ice@yahoo.com"
  s.homepage    = "http://github.com/bogdanRada/washout_builder_demo/"
  s.authors     = ["bogdanRada"]
  s.date =  Date.today

  s.licenses = ["MIT"]
  s.files = `git ls-files`.split("\n")
  s.test_files = s.files.grep(/^(spec)/)
  s.require_paths = ["lib"]

  s.add_dependency 'rails', '>= 4.0'

end
