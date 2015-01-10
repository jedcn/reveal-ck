module RevealCK
  module Markdown
    # This class embodies the preprocessing that starts with an HTML
    # document generated via Markdown and results in HTML that's
    # suitable for reveal.js slides.
    class PostProcessor
      attr_reader :doc
      def initialize(doc)
        @doc = doc
      end

      def process
        strip_whitespace
        unprotect_emojis
        handle_start
        handle_end
        transform_symbols_to_sections
      end

      private

      def strip_whitespace
        @doc = doc.strip
      end

      def unprotect_emojis
        @doc = doc.gsub(protected_emoji_regex) do |protected_emoji|
          protected_emoji.gsub(emoji_underscore_symbol, '_')
        end
      end

      def handle_start
        replace_if_start_with(vertical_start_symbol, vertical_start_doc)
        replace_if_start_with(divider_symbol, divider_start)
      end

      def handle_end
        replace_if_end_with(vertical_end_symbol, vertical_end_doc)
        replace_if_end_with(divider_symbol, divider_end)
      end

      def replace_if_start_with(old, new)
        old = "#{old}\n"
        return unless doc.start_with?(old)
        @doc = doc[old.size, doc.size - 1]
        @doc = "#{new}\n#{doc}"
      end

      def replace_if_end_with(old, new)
        return unless doc.end_with? old
        @doc = doc[0, doc.size - 1 - old.size]
        @doc = "#{doc}\n#{new}\n"
      end

      def transform_symbols_to_sections
        replace(divider_symbol, section_divider)
        replace(back_to_back_vertical_symbols_regex, vertical_end_start)
        replace(vertical_start_symbol, vertical_start)
        replace(vertical_end_symbol, vertical_end)
      end

      def replace(old, new)
        @doc = doc.gsub(old, new)
      end

      def divider_start
        '<section>'
      end

      def divider_end
        '</section>'
      end

      def vertical_start_doc
        "<section>\n<section>"
      end

      def vertical_end_doc
        "</section>\n</section>"
      end

      def vertical_start
        "</section>\n<section>\n<section>"
      end

      def vertical_end
        "</section>\n</section>\n<section>"
      end

      def section_divider
        "#{divider_end}\n#{divider_start}"
      end

      def emoji_underscore_symbol
        RevealCK::Markdown::REVEALCK_SYMBOL_FOR_EMOJI_UNDERSCORE
      end

      def divider_symbol
        RevealCK::Markdown::REVEALCK_SYMBOL_FOR_DIVIDER
      end

      def vertical_start_symbol
        RevealCK::Markdown::REVEALCK_SYMBOL_FOR_VERTICAL_START
      end

      def vertical_end_symbol
        RevealCK::Markdown::REVEALCK_SYMBOL_FOR_VERTICAL_END
      end

      def protected_emoji_regex
        /:[a-z\d_\-\+EU]*:/
      end

      def back_to_back_vertical_symbols_regex
        vertical_end = Regexp.escape(vertical_end_symbol)
        vertical_start = Regexp.escape(vertical_start_symbol)
        /#{vertical_end}\s*#{vertical_start}/
      end

      def vertical_end_start
        "</section>\n</section>\n\n<section>\n<section>"
      end
    end
  end
end
