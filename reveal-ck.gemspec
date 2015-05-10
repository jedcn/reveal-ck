# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require File.join([File.dirname(__FILE__),'lib','reveal-ck','version.rb'])

Gem::Specification.new do |s|
  # DON'T FORGET TO CHANGE ME!
  s.date = '2015-05-09'
  s.required_ruby_version = '>= 2.0.0'
  s.name        = 'reveal-ck'
  s.version     = RevealCK::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Jed Northridge']
  s.email       = ['reveal-ck@jedcn.com']
  s.homepage    = 'https://github.com/jedcn/reveal-ck'
  s.summary     = 'Create reveal.js presentations with Markdown.'
  s.description =
    'A command line interface for generating reveal.js presentations.

You have something important to say, and you are a busy person. Why not write your next presentation in (github flavored) markdown?

reveal-ck has been used by students, teachers, trainers, and conference presenters. It just "works." It lets you stay focused on your content-- not the tools that you are using to make your content.

It produces reveal.js presentations, which are beautiful and world-class. If you are already familiar with reveal.js, great! You will now be able to use html, html+erb, haml, or slim to most efficiently write out your presentation markup. You can provide your own CSS tweaks without intermingling "your" presentation code with reveal.js\'s base CSS.

You can write slides with a Ruby DSL! You can generate slide content with database and network calls.. but that\'s another story.

Finally-- livereload is built in-- so it supports a nice flow where you keep a browser open on your slides, and save with your editor, the browser updates with your latest work.'

  #
  # Runtime Dependencies
  s.add_dependency 'docile', '1.1.5'
  s.add_dependency 'gemoji', '2.1.0'
  s.add_dependency 'gli', '2.12.3'
  s.add_dependency 'guard', '2.12.4'
  s.add_dependency 'guard-livereload', '2.4.0'
  s.add_dependency 'haml', '4.0.6'
  s.add_dependency 'html-pipeline', '1.11.0'
  s.add_dependency 'listen', '2.8.5'
  s.add_dependency 'rack', '1.6.0'
  s.add_dependency 'rack-livereload', '0.3.15'
  s.add_dependency 'rake', '10.4.2'
  s.add_dependency 'redcarpet', '3.2.2'
  s.add_dependency 'rinku', '1.7.3'
  s.add_dependency 'slim', '3.0.2'
  s.add_dependency 'tilt', '2.0.1'

  #
  # Development Dependencies
  s.add_development_dependency 'aruba'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'nokogiri'
  s.add_development_dependency 'relish'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
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
