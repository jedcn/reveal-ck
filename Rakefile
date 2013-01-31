# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = 'reveal-ck'
  gem.homepage = 'https://github.com/jedcn/reveal-ck'
  gem.license = 'MIT'
  gem.summary = %Q{A toolkit that takes a minimal description of slides and builds a reveal.js presentation}
  gem.description = 'A reveal.js construction kit'
  gem.email = 'northridge@gmail.com'
  gem.authors = ['Jed Northridge']
  gem.files.include 'reveal.js/**/*'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

require 'rake/clean'

require_relative 'lib/reveal-ck'

file 'reveal.js/index.html' do
  `git submodule init`
  `git submodule update`
end
CLOBBER.include 'reveal.js'
task :clobber do
  # Spirit of clobber is to bring repository back to pristine state
  # after cloning. If that's the case, then we want to rm -r reveal.js
  # && mkdir reveal.js. By observation, redefining the task :clobber
  # and adding this mkdir achieves that
  mkdir 'reveal.js'
end

desc 'Build slides.html'
file 'slides.html' => 'slides.haml' do
  processor = HamlProcessor.open 'slides.haml'
  File.open('slides.html', 'w') { |f| f << processor.html }
end

directory 'slides'
CLEAN.include 'slides'

REVEAL_FILES = FileList["reveal.js/**/*"]

desc 'Build presentation'
task :presentation => [ 'reveal.js/index.html', 'slides', 'slides.html'] do
  cp 'slides.html', 'slides'
  cp_r REVEAL_FILES, 'slides'
  line_nums = {
    default_slides: {
      first: 37,
      last: 338
    }
  }
  default_slides = line_nums[:default_slides][:first]..line_nums[:default_slides][:last]
  FileSlicer.remove! 'slides/index.html', default_slides
  FileSplicer.insert! 'slides.html', into: 'slides/index.html', after: '<div class="slides">'
end

task :default => :spec
