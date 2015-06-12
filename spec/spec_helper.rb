require 'simplecov'
require 'codeclimate-test-reporter'
SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
end

# silence tilt autoload warnings
require 'tilt/erb'
require 'tilt/haml'

require_relative '../lib/reveal-ck'

RSpec.configure do |config|
  config.order = 'random'
end

def spec_data(*files)
  File.join 'spec', 'data', files
end
