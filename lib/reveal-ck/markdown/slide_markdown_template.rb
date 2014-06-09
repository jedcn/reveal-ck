require 'tilt/template'

module RevealCK
  module Markdown
    #
    # Public: This class allows SlideMarkdown to hook into Tilt 2.0. See
    # https://github.com/rtomayko/tilt.
    #
    class SlideMarkdownTemplate < ::Tilt::Template
      # Must be implemented by all subclasses of Tilt::Template
      def prepare
      end

      def evaluate(*)
        markdown = Redcarpet::Markdown.new(
                                           SlideMarkdown,
                                           fenced_code_blocks: true
                                          )
        @output = markdown.render(data)
      end
    end
  end
end
