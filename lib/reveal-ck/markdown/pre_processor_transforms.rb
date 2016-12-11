module RevealCK
  module Markdown
    # This class gives special meaning to legitimate markdown within
    # slides. This "slides markdown" is transformed into symbols that
    # are not markdown. Later on these will be transformed into HTML
    # meanings.
    #
    # For example,
    #
    # * --- becomes <div>DIVIDER</div>
    # * ```notes becomes <div>NOTES_OPEN</div>
    #
    class PreProcessorTransforms
      attr_reader :doc
      def initialize(doc)
        @doc = doc
      end

      def process
        transform_slide_notes_to_notes_symbols
        transform_slide_dividers_to_divider_symbols
        transform_slide_verticals_to_vertical_symbols
      end

      private

      def transform_slide_notes_to_notes_symbols
        match = find_next_notes_match(0)
        while match
          match_start = match.offset(0)[0]
          match_end = match.offset(0)[1]
          replace_notes_open_with_symbol(match_start, match_end - match_start)
          close_start = find_next_notes_close(match_start)
          replace_notes_close_with_symbol(close_start) if close_start
          match = find_next_notes_match(match_start)
        end
      end

      def find_next_notes_match(current)
        doc.match(slide_notes_regex, current)
      end

      def find_next_notes_close(current)
        doc.index('```', current)
      end

      def replace_notes_open_with_symbol(start, length)
        doc.slice!(start, length)
        doc.insert(start, notes_open_symbol)
      end

      def replace_notes_close_with_symbol(start)
        doc.slice!(start, 3)
        doc.insert(start, notes_close_symbol)
      end

      def transform_slide_dividers_to_divider_symbols
        doc.gsub!(slide_divider_regex, divider_symbol)
      end

      def transform_slide_verticals_to_vertical_symbols
        count = 0
        doc.gsub!(slide_vertical_regex) do
          count += 1
          if count.odd?
            vertical_start_symbol
          else
            vertical_end_symbol
          end
        end
      end

      def slide_notes_regex
        /^```notes?$/
      end

      def slide_divider_regex
        /^---$/
      end

      def slide_vertical_regex
        /^\*\*\*$/
      end

      def newline_wrapped(s)
        "\n#{s}\n"
      end

      def notes_open_symbol
        newline_wrapped(RevealCK::Markdown::REVEALCK_SYMBOL_FOR_NOTES_OPEN)
      end

      def notes_close_symbol
        newline_wrapped(RevealCK::Markdown::REVEALCK_SYMBOL_FOR_NOTES_CLOSE)
      end

      def divider_symbol
        newline_wrapped(RevealCK::Markdown::REVEALCK_SYMBOL_FOR_DIVIDER)
      end

      def vertical_start_symbol
        newline_wrapped(RevealCK::Markdown::REVEALCK_SYMBOL_FOR_VERTICAL_START)
      end

      def vertical_end_symbol
        newline_wrapped(RevealCK::Markdown::REVEALCK_SYMBOL_FOR_VERTICAL_END)
      end
    end
  end
end
