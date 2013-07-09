require 'cucumber'
require 'cucumber/rake/task'
require 'rake/clean'

CUKE_RESULTS = 'cucumber_results.html'

CLEAN << CUKE_RESULTS

desc 'Run Cucumber'
Cucumber::Rake::Task.new(:cucumber) do |t|
  opts = "features --format html -o #{CUKE_RESULTS} --format progress -x"
  opts += " --tags #{ENV['TAGS']}" if ENV['TAGS']
  t.cucumber_opts =  opts
  t.fork = false
end
