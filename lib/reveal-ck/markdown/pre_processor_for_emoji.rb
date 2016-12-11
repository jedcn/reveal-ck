module RevealCK
  module Markdown
    # This class knows how to modify emoji so that underscores within
    # emoji are not considered as indicators of markdown emphasis.
    class PreProcessorForEmoji
      attr_reader :doc
      def initialize(doc)
        @doc = doc
      end

      def process
        protect_emojis
      end

      private

      def protect_emojis
        doc.gsub!(emoji_regex) do |emoji|
          emoji.gsub(/_/, emoji_underscore_symbol)
        end
      end

      def emoji_regex
        /:[a-z\d_\-\+]*:/
      end

      def emoji_underscore_symbol
        RevealCK::Markdown::REVEALCK_SYMBOL_FOR_EMOJI_UNDERSCORE
      end
    end
  end
end
