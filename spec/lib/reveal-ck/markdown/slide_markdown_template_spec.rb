require 'spec_helper'

module RevealCK
  module Markdown
    describe SlideMarkdownTemplate do

      let :basic_slide_markdown do
        <<-eos
# First Slide
---
# Second Slide
eos
      end

      it 'handles markdown ' do
        require 'tempfile'
        file = Tempfile.new(['test', '.md'])
        file.write(basic_slide_markdown)
        file.close
        template = Tilt.new(file.path)
        output = template.render
        output.should include '<h1>First Slide</h1>'
        output.should include "</section>\n<section>"
        output.should include '<h1>Second Slide</h1>'
      end

    end
  end
end
