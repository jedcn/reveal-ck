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
        PreProcessorForEmoji.new(doc).process
        PreProcessorForDividers.new(doc).process
        PreProcessorTransforms.new(doc).process
        doc.lstrip
      end

      private

      def strip_whitespace
        doc.strip!
      end
    end
  end
end
