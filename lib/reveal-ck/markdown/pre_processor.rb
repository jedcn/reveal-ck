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
        add_first_slide_divider_if_needed
        add_last_slide_vertical_if_needed
        add_last_slide_divider_if_needed
        transform_slide_dividers_to_divider_symbols
        transform_slide_verticals_to_vertical_symbols
        @doc.lstrip
      end

      private

      def strip_whitespace
        @doc = doc.strip
      end

      def add_first_slide_divider_if_needed
        return if doc.start_with?(slide_divider)
        return if doc.start_with?(slide_vertical)
        @doc = "#{slide_divider}\n#{doc}"
      end

      def add_last_slide_divider_if_needed
        return if doc.end_with?(slide_divider) || doc.end_with?(slide_vertical)
        @doc = "#{doc}\n#{slide_divider}"
      end

      def transform_slide_dividers_to_divider_symbols
        @doc =
          doc.gsub(slide_divider_regex, "\n#{divider_symbol}\n")
      end

      def transform_slide_verticals_to_vertical_symbols
        @doc = doc.gsub(slide_vertical_regex, "\n#{vertical_symbol}\n")
      end

      def add_last_slide_vertical_if_needed
        return unless doc.scan(slide_vertical_regex).size.odd?
        @doc = "#{doc}\n#{slide_vertical}"
      end

      def slide_divider
        '---'
      end

      def slide_divider_regex
        /^---$/
      end

      def slide_vertical
        '***'
      end

      def slide_vertical_regex
        /^\*\*\*$/
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
