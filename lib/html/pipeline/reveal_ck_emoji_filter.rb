require 'html_pipeline'
require 'gemoji'

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

      def call(text, context: {}, result: {}) # rubocop:disable Lint/UnusedMethodArgument
        text.gsub(EMOJI_PATTERN) do |match|
          emoji = Emoji.find_by_alias(match[1..-2])
          emoji ? emoji_img_tag(match, emoji, context[:asset_root]) : match
        end
      end

      private

      def emoji_img_tag(token, emoji, asset_root)
        root = (asset_root || '').chomp('/')
        src = "#{root}/emoji/#{emoji.image_filename}"
        "<img class='emoji' alt='#{token}' src='#{src}' />"
      end
    end
  end
end
