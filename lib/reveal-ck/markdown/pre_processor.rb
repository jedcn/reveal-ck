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
        protect_emojis
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

      def protect_emojis
        @doc = doc.gsub(emoji_regex) do |emoji|
          emoji.gsub(/_/, emoji_underscore_symbol)
        end
      end

      def add_first_slide_divider_if_needed
        return if doc.start_with?(slide_divider)
        return if doc.start_with?(slide_vertical)
        prepend(slide_divider)
      end

      def add_last_slide_divider_if_needed
        return if doc.end_with?(slide_divider)
        return if doc.end_with?(slide_vertical)
        append(slide_divider)
      end

      def transform_slide_dividers_to_divider_symbols
        @doc =
          doc.gsub(slide_divider_regex,
                   newline_wrapped(divider_symbol))
      end

      def transform_slide_verticals_to_vertical_symbols
        count = 0
        @doc = doc.gsub(slide_vertical_regex) do
          count += 1
          if count.odd?
            newline_wrapped(vertical_start_symbol)
          else
            newline_wrapped(vertical_end_symbol)
          end
        end
      end

      def add_last_slide_vertical_if_needed
        return unless doc.scan(slide_vertical_regex).size.odd?
        append(slide_vertical)
      end

      def emoji_regex
        /:[a-z\d_\-\+]*:/
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

      def prepend(s)
        @doc = "#{s}\n#{doc}"
      end

      def append(s)
        @doc = "#{doc}\n#{s}"
      end

      def newline_wrapped(s)
        "\n#{s}\n"
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
    end
  end
end
