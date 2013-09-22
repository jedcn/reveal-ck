require_relative 'reveal-ck/version'
require_relative 'reveal-ck/config'
require_relative 'reveal-ck/file_string_replacer'
require_relative 'reveal-ck/file_slicer'
require_relative 'reveal-ck/file_splicer'
require_relative 'reveal-ck/template_finder'
require_relative 'reveal-ck/template_processor'
require_relative 'reveal-ck/slide'
require_relative 'reveal-ck/presentation'
require_relative 'reveal-ck/build_task'
require_relative 'reveal-ck/builder'
require_relative 'reveal-ck/slides_html_builder'
require_relative 'reveal-ck/slide_builder'
require_relative 'reveal-ck/presentation_builder'

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
