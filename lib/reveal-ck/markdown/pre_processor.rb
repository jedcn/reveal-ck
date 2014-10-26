module RevealCK
  module Markdown
    # This class embodies the preprocessing that starts with a
    # traditional Markdown document and turns it into something that
    # can later "become" reveal.js slides.
    class PreProcessor
      attr_reader :doc
      def initialize(doc)
        @doc = doc
      end

      def process
        strip_whitespace
        remove_first_slide_divider_if_needed
        remove_last_slide_divider_if_needed
        transform_slide_dividers_to_divider_symbols
        wrap_in_divider_symbols
      end

      private

      def strip_whitespace
        @doc = doc.strip
      end

      def remove_first_slide_divider_if_needed
        return unless doc.start_with?("#{slide_divider}\n")
        @doc = doc["#{slide_divider}\n".size, doc.size - 1]
      end

      def remove_last_slide_divider_if_needed
        return unless doc.end_with?("#{slide_divider}")
        @doc = doc[0, doc.size - 1 - slide_divider.size]
      end

      def transform_slide_dividers_to_divider_symbols
        @doc = doc.gsub(slide_divider_regex, "\n#{divider_symbol}\n")
      end

      def wrap_in_divider_symbols
        "#{divider_symbol}\n\n#{doc}\n\n#{divider_symbol}\n"
      end

      def slide_divider
        '---'
      end

      def slide_divider_regex
        /^---$/
      end

      def divider_symbol
        RevealCK::Markdown::REVEALCK_SYMBOL_FOR_DIVIDER
      end
    end
  end
end
