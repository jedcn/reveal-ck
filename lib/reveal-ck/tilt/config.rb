# Direct Tilt to use SlideMarkdownTemplate for "md" files
Tilt.register Tilt::KramdownTemplate, 'kramdown'

Tilt.register RevealCK::Markdown::SlideMarkdownTemplate, 'md', 'markdown'

# The following requires are present to avoid warnings such as:
#
# WARN: tilt autoloading 'tilt/erb' in a non thread-safe way; explicit
# require 'tilt/erb' suggested.
#
# The same goes for tilt/haml
# require 'tilt/haml'
