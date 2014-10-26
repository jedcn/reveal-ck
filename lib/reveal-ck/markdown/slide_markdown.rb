require 'redcarpet'

module RevealCK
  module Markdown
    # This class defines what "Slide Markdown" is.
    class SlideMarkdown < Redcarpet::Render::HTML
      MARKDOWN_SLIDE_DIVIDER = '---'
      MARKDOWN_SLIDE_DIVIDER_REGEX = /^---$/
      REVEALCK_SYMBOL_FOR_DIVIDER = '<div>DIVIDER</div>'
      def preprocess(doc)
        doc = doc.strip
        if doc.start_with?("#{MARKDOWN_SLIDE_DIVIDER}\n")
          doc = doc["#{MARKDOWN_SLIDE_DIVIDER}\n".size, doc.size - 1]
        end
        if doc.end_with?("#{MARKDOWN_SLIDE_DIVIDER}")
          doc = doc[0, doc.size - 1 - MARKDOWN_SLIDE_DIVIDER.size]
        end

        doc = doc.gsub(MARKDOWN_SLIDE_DIVIDER_REGEX,
                       "\n#{REVEALCK_SYMBOL_FOR_DIVIDER}\n")

        "#{REVEALCK_SYMBOL_FOR_DIVIDER}\n\n#{doc}\n\n#{REVEALCK_SYMBOL_FOR_DIVIDER}\n"
      end

      HTML_SLIDE_START = '<section>'
      HTML_SLIDE_END = '</section>'
      HTML_SLIDE_DIVIDER = "#{HTML_SLIDE_END}\n#{HTML_SLIDE_START}"

      def postprocess(doc)
        doc = doc["#{REVEALCK_SYMBOL_FOR_DIVIDER}\n".size, doc.size - 1]
        doc = doc[0, doc.size - 1 - "\n#{REVEALCK_SYMBOL_FOR_DIVIDER}".size]

        doc = doc.gsub(REVEALCK_SYMBOL_FOR_DIVIDER, HTML_SLIDE_DIVIDER)

        "#{HTML_SLIDE_START}\n#{doc}\n#{HTML_SLIDE_END}\n"
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
