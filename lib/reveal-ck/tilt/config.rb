# Direct Tilt to use SlideMarkdownTemplate for "md" files
Tilt.register RevealCK::Markdown::SlideMarkdownTemplate, 'md'

# The following requires are present to avoid warnings such as:
#
# WARN: tilt autoloading 'tilt/erb' in a non thread-safe way; explicit
# require 'tilt/erb' suggested.
#
# The same goes for tilt/haml, tilt/redcloth
# require 'tilt/erb'
# require 'tilt/haml'
# require 'tilt/redcloth'
