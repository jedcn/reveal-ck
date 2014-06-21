require 'simplecov'
SimpleCov.start
require_relative '../lib/reveal-ck'

RSpec.configure do |config|
  config.order = 'random'
end

def spec_data(*files)
  File.join 'spec', 'data', files
end
