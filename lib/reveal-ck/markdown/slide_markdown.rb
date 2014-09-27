require 'redcarpet'

module RevealCK
  module Markdown
    # This class defines what "Slide Markdown" is.
    class SlideMarkdown < Redcarpet::Render::HTML
      HR = '<hr>'
      HR_NEWLINE = "<hr>\n"

      HTML_SLIDE_START = '<section>'
      HTML_SLIDE_END = '</section>'
      HTML_SLIDE_DIVIDER = "#{HTML_SLIDE_END}\n#{HTML_SLIDE_START}"

      MARKDOWN_SLIDE_DIVIDER = '---'
      MARKDOWN_SLIDE_DIVIDER_REGEX = /^---$/
      MARKDOWN_SLIDE_DIVIDER_WITH_NEWLINES = "\n---\n"

      def preprocess(doc)
        doc.gsub(MARKDOWN_SLIDE_DIVIDER_REGEX,
                 MARKDOWN_SLIDE_DIVIDER_WITH_NEWLINES)
      end

      def postprocess(doc)
        doc = doc[HR.size, doc.size - 1] if doc.start_with?(HR)

        if doc.end_with?(HR_NEWLINE)
          doc = doc[0, doc.size - 1 - HR_NEWLINE.size]
        end
        doc = doc.gsub(HR, HTML_SLIDE_DIVIDER)
        "#{HTML_SLIDE_START}\n#{doc}\n#{HTML_SLIDE_END}"
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
