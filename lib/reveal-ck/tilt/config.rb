# Direct Tilt to use SlideMarkdownTemplate for "md" files
Tilt.register RevealCK::Markdown::SlideMarkdownTemplate, 'md', 'markdown'

# Direct Tilt to use SlideKramdownTemplate for ".kramdown" files
Tilt.register RevealCK::Markdown::SlideKramdownTemplate, 'kramdown'

# The following requires are present to avoid warnings such as:
#
# WARN: tilt autoloading 'tilt/erb' in a non thread-safe way; explicit
# require 'tilt/erb' suggested.
#
# The same goes for tilt/haml
# require 'tilt/haml'
