require 'rubygems'

require 'bundler'
Bundler::GemHelper.install_tasks

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

task default: :ci

task test: [:spec, :cucumber]
