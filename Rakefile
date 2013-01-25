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

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

require_relative 'lib/reveal-ck'

desc 'Build slides.html'
file 'slides.html' => 'slides.haml' do
  processor = HamlProcessor.open 'slides.haml'
  File.open('slides.html', 'w') { |f| f << processor.html }
end

task :default => :spec
