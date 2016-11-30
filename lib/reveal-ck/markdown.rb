module RevealCK
  # This module defines how reveal-ck works with redcarpet to produce
  # slides from markdown.
  module Markdown
    REVEALCK_SYMBOL_FOR_DIVIDER          = '<div>DIVIDER</div>'.freeze
    REVEALCK_SYMBOL_FOR_VERTICAL_START   = '<div>VERTICAL_START</div>'.freeze
    REVEALCK_SYMBOL_FOR_VERTICAL_END     = '<div>VERTICAL_END</div>'.freeze
    REVEALCK_SYMBOL_FOR_EMOJI_UNDERSCORE = 'EU'.freeze
  end
end

require_relative 'markdown/slide_markdown'
require_relative 'markdown/pre_processor'
require_relative 'markdown/post_processor'
require_relative 'markdown/slide_markdown_template'
require_relative 'markdown/slide_kramdown_template'
