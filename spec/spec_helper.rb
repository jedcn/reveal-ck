require 'simplecov'
require 'active_support/core_ext/string/strip'

SimpleCov.start

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
