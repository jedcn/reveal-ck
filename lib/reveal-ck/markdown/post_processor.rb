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
        remove_first_divider_symbol
        remove_last_divider_symbol
        transform_divider_symbols_to_sections
        wrap_in_sections
      end

      private

      def remove_first_divider_symbol
        @doc =
          doc["#{divider_symbol}\n".size, doc.size - 1]
      end

      def remove_last_divider_symbol
        @doc =
          doc[0, doc.size - 1 - "\n#{divider_symbol}".size]
      end

      def transform_divider_symbols_to_sections
        @doc =
          doc.gsub(divider_symbol, section_divider)
      end

      def wrap_in_sections
        "#{section_start}\n#{doc}\n#{section_end}\n"
      end

      def section_start
        '<section>'
      end

      def section_end
        '</section>'
      end

      def section_divider
        "#{section_end}\n#{section_start}"
      end

      def divider_symbol
        RevealCK::Markdown::REVEALCK_SYMBOL_FOR_DIVIDER
      end
    end
  end
end
