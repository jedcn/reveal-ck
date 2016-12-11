module RevealCK
  module Markdown
    # This class embodies the preprocessing that starts with a
    # traditional Markdown document and turns it into something that
    # can later "become" reveal.js slides.
    class PreProcessorForDividers
      attr_reader :doc
      def initialize(doc)
        @doc = doc
      end

      def process
        add_first_slide_divider_if_needed
        add_last_slide_vertical_if_needed
        add_last_slide_divider_if_needed
      end

      private

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

      def add_last_slide_vertical_if_needed
        return unless doc.scan(slide_vertical_regex).size.odd?
        append(slide_vertical)
      end

      def slide_divider
        '---'
      end

      def slide_vertical
        '***'
      end

      def slide_vertical_regex
        /^\*\*\*$/
      end

      def prepend(s)
        doc.insert(0, "#{s}\n")
      end

      def append(s)
        doc.insert(doc.size, "\n#{s}")
      end
    end
  end
end
