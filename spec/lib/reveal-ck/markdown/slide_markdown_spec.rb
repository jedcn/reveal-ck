require 'spec_helper'

module RevealCK
  module Markdown
    describe SlideMarkdown, '#postprocess' do

      let :slide_markdown do
        SlideMarkdown.new
      end

      describe '#postprocess' do
        let :basic_input do
          <<-eos
<h1>h1 Slide</h1>

<hr>

<h2>h2 Slide</h2>
eos
        end

        let :leading_hr_input do
          <<-eos
<hr>

<h1>h1 Slide</h1>

<hr>

<h2>h2 Slide</h2>
eos
        end

        let :trailing_hr_input do
          <<-eos
<h1>h1 Slide</h1>

<hr>

<h2>h2 Slide</h2>

<hr>
eos
        end

        it 'wraps its content in a <section>"' do
          output = slide_markdown.postprocess(basic_input)
          expect(output).to start_with '<section>'
          expect(output).to end_with '</section>'
          expect(output.scan('<section>').size).to eq 2
          expect(output.scan('</section>').size).to eq 2
        end

        it 'replaces <hr> with section breaks' do
          output = slide_markdown.postprocess(basic_input)
          expect(output).to_not include 'hr'
          expect(output).to include '<h1>h1 Slide</h1>'
          expect(output).to include '<h2>h2 Slide</h2>'
        end

        it 'does not turn an initial <hr> into a section' do
          output = slide_markdown.postprocess(leading_hr_input)
          expect(output.scan('<section>').size).to eq 2
          expect(output.scan('</section>').size).to eq 2
          expect(output).to_not include 'hr'
        end

        it 'does not turn a trailing <hr> into a section' do
          output = slide_markdown.postprocess(trailing_hr_input)
          expect(output.scan('<section>').size).to eq 2
          expect(output.scan('</section>').size).to eq 2
          expect(output).to_not include 'hr'
        end
      end
    end
  end
end
