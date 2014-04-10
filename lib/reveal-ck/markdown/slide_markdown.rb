require 'redcarpet'

module RevealCK
  module Markdown
    #
    # Public: This class defines what "Slide Markdown" is: an
    # extension of regular Redcarpet Markdown with some basic post
    # processing.
    #
    class SlideMarkdown < Redcarpet::Render::HTML
      HR = '<hr>'
      HR_NEWLINE = "<hr>\n"

      SLIDE_START = '<section>'
      SLIDE_END = '</section>'
      SLIDE_DIVIDER = "#{SLIDE_END}\n#{SLIDE_START}"

      def postprocess(doc)
        doc = doc[HR.size, doc.size - 1] if doc.start_with?(HR)

        if doc.end_with?(HR_NEWLINE)
          doc = doc[0, doc.size - 1 - HR_NEWLINE.size]
        end
        doc = doc.gsub(HR, SLIDE_DIVIDER)
        "#{SLIDE_START}\n#{doc}\n#{SLIDE_END}"
      end
    end
  end
end
