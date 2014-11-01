require 'redcarpet'

module RevealCK
  module Markdown
    # This class defines what "Slide Markdown" is.
    class SlideMarkdown < Redcarpet::Render::HTML
      def preprocess(doc)
        PreProcessor.new(doc).process
      end

      def postprocess(doc)
        PostProcessor.new(doc).process
      end

      def block_code(code, language)
        if language.nil?
          "<pre><code>#{code}</code></pre>"
        elsif language == 'notes' || language == 'note'
          "<aside class='notes'>#{code}</aside>"
        else
          "<pre><code class=\"#{language}\">#{code}</code></pre>"
        end
      end
    end
  end
end
