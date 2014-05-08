require_relative 'reveal-ck/version'
require_relative 'reveal-ck/config'
require_relative 'reveal-ck/required_arg'
require_relative 'reveal-ck/render'
require_relative 'reveal-ck/slide'
require_relative 'reveal-ck/presentation'
require_relative 'reveal-ck/presentation_dsl'
require_relative 'reveal-ck/templates'
require_relative 'reveal-ck/builders'
require_relative 'reveal-ck/markdown'
require_relative 'reveal-ck/tilt/config'

# RevealCK::LOCATION is the path where reveal-ck is residing on your
# system as a gem.
module RevealCK
  lib = File.dirname __FILE__
  root = File.join lib, '..'
  LOCATION = File.expand_path root
end

# RevealCK::REVEALJS_FILES is a list of files that compromise
# reveal.js bundled into this gem.
module RevealCK
  revealjs = File.join LOCATION, 'reveal.js'
  REVEALJS_FILES = Dir.glob "#{revealjs}/**/*"
end
