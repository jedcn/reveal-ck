require "html_pipeline"
require "gemoji"

module HTML
  class Pipeline
    # HTMLPipeline 3.x text filter that replaces :emoji: tokens with
    # <img> tags. Inherits from HTMLPipeline::TextFilter so it works as
    # a text_filter in the new pipeline architecture.
    class RevealCKEmojiFilter < HTMLPipeline::TextFilter
      EMOJI_PATTERN = /:[a-z\d_+-]+:/

      def initialize(context: {}, result: {})
        super
      end

      def call(text, context: {}, result: {})
        text.gsub(EMOJI_PATTERN) do |match|
          name = match[1..-2]
          emoji = Emoji.find_by_alias(name)
          if emoji
            asset_root = (context[:asset_root] || "").chomp("/")
            src = "#{asset_root}/emoji/#{emoji.image_filename}"
            "<img class='emoji' alt='#{match}' src='#{src}' />"
          else
            match
          end
        end
      end
    end
  end
end
