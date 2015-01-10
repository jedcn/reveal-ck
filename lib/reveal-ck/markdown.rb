module RevealCK
  # This module defines how reveal-ck works with redcarpet to produce
  # slides from markdown.
  module Markdown
    REVEALCK_SYMBOL_FOR_DIVIDER          = '<div>DIVIDER</div>'
    REVEALCK_SYMBOL_FOR_VERTICAL_START   = '<div>VERTICAL_START</div>'
    REVEALCK_SYMBOL_FOR_VERTICAL_END     = '<div>VERTICAL_END</div>'
    REVEALCK_SYMBOL_FOR_EMOJI_UNDERSCORE = 'EU'
  end
end

require_relative 'markdown/slide_markdown'
require_relative 'markdown/pre_processor'
require_relative 'markdown/post_processor'
require_relative 'markdown/slide_markdown_template'
