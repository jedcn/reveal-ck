# The following require adds "#to_json" to Hash. This is needed in
# script.js.erb. We do it here to provide as much clarity as is
# possible.
require 'json'

require_relative 'reveal-ck/version'
require_relative 'reveal-ck/config'
require_relative 'reveal-ck/retrieve'
require_relative 'reveal-ck/filtered_html_string'
require_relative 'reveal-ck/render'
require_relative 'reveal-ck/slide'
require_relative 'reveal-ck/presentation'
require_relative 'reveal-ck/presentation_dsl'
require_relative 'reveal-ck/templates'
require_relative 'reveal-ck/builders'
require_relative 'reveal-ck/markdown'
require_relative 'reveal-ck/tilt/config'
require_relative 'reveal-ck/commands'

# RevealCK::path provides the path where files within the reveal-ck
# gem are located on your system.
module RevealCK
  def self.path(*args)
    lib = File.dirname(__FILE__)
    gem_root = File.join(lib, '..')
    location = File.expand_path(gem_root)
    File.join(location, *args)
  end

  def self.template_path(*args)
    lib = File.dirname(__FILE__)
    gem_root = File.join(lib, '..', 'files', 'reveal-ck', 'templates')
    location = File.expand_path(gem_root)
    File.join(location, *args)
  end
end
