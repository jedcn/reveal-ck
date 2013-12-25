require 'spec_helper'

module RevealCK
  module Markdown

    describe SlideMarkdown, '#postprocess' do

      let :slide_markdown do
        SlideMarkdown.new
      end

      let :basic_input do
        <<-eos
<h1>First Slide</h1>

<hr>

<h1>Second Slide</h1>
eos
      end

      let :leading_hr_input do
        <<-eos
<hr>

<h1>First Slide</h1>

<hr>

<h1>Second Slide</h1>
eos
      end

      let :trailing_hr_input do
        <<-eos
<h1>First Slide</h1>

<hr>

<h1>Second Slide</h1>

<hr>
eos
      end

      it 'prepends an opening "<section>"' do
        output = slide_markdown.postprocess(basic_input)
        output.should start_with "<section>"
      end

      it 'appends a closing "</section>"' do
        output = slide_markdown.postprocess(basic_input)
        output.should end_with "</section>"
      end

      it 'replaces "<hr>"s with section breaks' do
        output = slide_markdown.postprocess(basic_input)
        output.should include '<h1>First Slide</h1>'
        output.should include "</section>\n<section>"
        output.should include '<h1>Second Slide</h1>'
      end

      it 'trims off an initial <hr>' do
        output = slide_markdown.postprocess(leading_hr_input)
        output.should_not start_with "<section>\n</section>"
      end

      it 'trims off a trailing <hr>' do
        output = slide_markdown.postprocess(trailing_hr_input)
        output.should_not =~ /<section>\s*<\/section>/m
      end

    end

  end
end
