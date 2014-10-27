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
        handle_start
        handle_end
        transform_symbols_to_sections
      end

      private

      def handle_start
        if doc.start_with? vertical_symbol
          @doc =
            doc["#{vertical_symbol}\n".size, doc.size - 1]
          @doc = "#{vertical_start}\n#{doc}"
        else
          @doc =
            doc["#{divider_symbol}\n".size, doc.size - 1]
          @doc = "#{divider_start}\n#{doc}"
        end
      end

      def handle_end
        if doc.end_with? vertical_symbol
          @doc =
            doc[0, doc.size - 1 - "\n#{vertical_symbol}".size]
          @doc = "#{doc}\n#{vertical_end}\n"
        else
          @doc =
            doc[0, doc.size - 1 - "\n#{divider_symbol}".size]
          @doc = "#{doc}\n#{divider_end}\n"
        end
      end

      def transform_symbols_to_sections
        @doc =
          doc.gsub(divider_symbol, section_divider)
        count = 0
        @doc = doc.gsub(vertical_symbol) do
          count += 1
          count.odd? ? vertical_start : vertical_end
        end
      end

      def divider_start
        '<section>'
      end

      def divider_end
        '</section>'
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

      def divider_symbol
        RevealCK::Markdown::REVEALCK_SYMBOL_FOR_DIVIDER
      end

      def vertical_symbol
        RevealCK::Markdown::REVEALCK_SYMBOL_FOR_VERTICAL
      end
    end
  end
end
