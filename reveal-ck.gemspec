# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require File.join([File.dirname(__FILE__),'lib','reveal-ck','version.rb'])

Gem::Specification.new do |s|
  # DON'T FORGET TO CHANGE ME!
  s.date = '2016-06-04'
  s.required_ruby_version = '>= 2.0.0'
  s.name        = 'reveal-ck'
  s.version     = RevealCK::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Jed Northridge']
  s.email       = ['reveal-ck@jedcn.com']
  s.homepage    = 'https://github.com/jedcn/reveal-ck'
  s.summary     = 'Create reveal.js presentations with Markdown.'
  s.description =
    'A command line interface for generating reveal.js presentations from markdown.'
  #
  # Runtime Dependencies
  s.add_dependency 'docile', '1.1.5'
  s.add_dependency 'gemoji', '2.1.0'
  s.add_dependency 'gli', '2.13.2'
  s.add_dependency 'guard', '2.13.0'
  s.add_dependency 'guard-livereload', '2.4.0'
  s.add_dependency 'haml', '4.0.7'
  s.add_dependency 'html-pipeline', '2.1.0'
  s.add_dependency 'listen', '3.0.3'
  s.add_dependency 'rack', '1.6.4'
  s.add_dependency 'rack-livereload', '0.3.16'
  s.add_dependency 'rake', '10.4.2'
  s.add_dependency 'redcarpet', '3.3.2'
  s.add_dependency 'rinku', '1.7.3'
  s.add_dependency 'slim', '3.0.6'
  s.add_dependency 'tilt', '2.0.1'

  #
  # Development Dependencies
  s.add_development_dependency 'aruba', '~> 0.9'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'cucumber', '~> 2.1'
  s.add_development_dependency 'nokogiri'
  s.add_development_dependency 'relish'
  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'rubocop', '~> 0.34'
  s.add_development_dependency 'simplecov'

  files = {
    core: ['LICENSE', 'Rakefile', 'Gemfile'],
    supporting: Dir.glob('files/**/*'),
    lib: `git ls-files lib`.split("\n"),
    rakelib: `git ls-files rakelib`.split("\n")
  }

  s.files         = files[:core] + files[:lib] + files[:rakelib] + files[:supporting]
  s.test_files    = `git ls-files -- {spec,features}/**/*`.split("\n")
  s.executables   = ['reveal-ck']
  s.require_paths = ['lib']
  s.extra_rdoc_files = [
    'LICENSE',
    'README.md'
  ]
  s.licenses = ['MIT']
  s.require_paths = ['lib']
end
