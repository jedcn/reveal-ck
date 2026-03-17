require 'cucumber'
require 'cucumber/rake/task'
require 'rake/clean'

CUKE_RESULTS = 'cucumber_results.html'.freeze

CLEAN << CUKE_RESULTS

desc 'Run Cucumber'
Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = ['features', '--format', 'progress']
  t.cucumber_opts += ['--tags', ENV['TAGS']] if ENV['TAGS']
  t.fork = false
end
