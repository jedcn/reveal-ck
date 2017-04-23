# -*- encoding: utf-8 -*-

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require File.join([File.dirname(__FILE__), 'lib', 'reveal-ck', 'version.rb'])

Gem::Specification.new do |s|
  s.date = '2017-04-23'
  s.required_ruby_version = '>= 2.2.2'
  s.name        = 'reveal-ck'
  s.version     = RevealCK::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Jed Northridge']
  s.email       = ['reveal-ck@jedcn.com']
  s.homepage    = 'https://github.com/jedcn/reveal-ck'
  s.summary     = 'Create reveal.js presentations with Markdown.'
  s.description =
    'A cli for generating reveal.js presentations from markdown.'
  #
  # Runtime Dependencies
  s.add_dependency 'docile', '1.1.5'
  s.add_dependency 'gemoji', '3.0.0'
  s.add_dependency 'gli', '2.14.0'
  s.add_dependency 'guard', '2.14.0'
  s.add_dependency 'guard-livereload', '2.5.2'
  s.add_dependency 'haml', '4.0.7'
  s.add_dependency 'html-pipeline', '2.4.2'
  s.add_dependency 'kramdown', '1.13.1'
  s.add_dependency 'listen', '3.1.5'
  s.add_dependency 'rack', '2.0.1'
  s.add_dependency 'rack-livereload', '0.3.16'
  s.add_dependency 'rake', '12.0.0'
  s.add_dependency 'rinku', '2.0.2'
  s.add_dependency 'slim', '3.0.7'
  s.add_dependency 'tilt', '2.0.5'
  s.add_dependency 'thor', '0.19.1'

  #
  # Development Dependencies
  s.add_development_dependency 'activesupport'
  s.add_development_dependency 'aruba'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'nokogiri'
  s.add_development_dependency 'relish'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'simplecov'

  files = {
    core: %w[LICENSE Rakefile Gemfile],
    supporting: Dir.glob('files/**/*'),
    lib: `git ls-files lib`.split("\n"),
    rakelib: `git ls-files rakelib`.split("\n")
  }

  s.files         = files[:core] + files[:lib] + files[:rakelib] +
                    files[:supporting]
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
