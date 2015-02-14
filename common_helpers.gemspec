# encoding: utf-8

$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'common_helpers/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'common_helpers'
  s.version     = CommonHelpers::VERSION
  s.authors     = ['Rafael Uchôa']
  s.email       = ['rafael@overmediacast.com']
  s.homepage    = 'https://github.com/uchoaaa/common_helpers'
  s.summary     = 'Common used Rails helpers'
  s.description = 'Common used Rails helpers'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4'

  s.add_development_dependency 'sqlite3'
end
