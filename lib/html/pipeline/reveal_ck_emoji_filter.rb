module HTML
  class Pipeline
    # This class is very similar EmojiFilter. It removes the inline
    # width/height attributes so that reveal-ck supplied CSS takes effect.
    class RevealCKEmojiFilter < EmojiFilter
      def emoji_image_filter(text)
        return text unless text.include?(':')

        text.gsub(emoji_pattern) do
          name = Regexp.last_match[1]
          result = "<img class='emoji' title=':#{name}:' alt=':#{name}:' "
          result + "src='#{emoji_url(name)}' align='absmiddle' />"
        end
      end
    end
  end
end
