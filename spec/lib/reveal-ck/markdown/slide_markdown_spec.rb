require 'spec_helper'

module RevealCK
  module Markdown
    describe SlideMarkdown, '#postprocess' do

      let :slide_markdown do
        SlideMarkdown.new
      end

      let :three_slides_in_markdown do
        <<-eos
First
---
Second
---
Third
eos
      end

      let :three_slides_after_preprocess do
        <<-eos
<div>DIVIDER</div>

First

<div>DIVIDER</div>

Second

<div>DIVIDER</div>

Third

<div>DIVIDER</div>
eos
      end

      let :three_slides_after_postprocess do
        <<-eos
<section>

<p>First</p>

</section>
<section>

<p>Second</p>

</section>
<section>

<p>Third</p>

</section>
eos
      end

      let :preprocess_standard_result do
        <<-eos
<div>DIVIDER</div>

First

<div>DIVIDER</div>
eos
      end

      describe '#preprocess' do

        it 'wraps a document with <div>DIVIDER</div>s' do
          output = slide_markdown.preprocess 'First'
          expect(output).to eq preprocess_standard_result
        end

        it 'is consistent when starting+ending separators are used' do
          output = slide_markdown.preprocess <<-eos
---
First
---
eos
          expect(output).to eq preprocess_standard_result
        end

        it 'is consistent when only starting separators are used' do
          output = slide_markdown.preprocess <<-eos
---
First
eos
          expect(output).to eq preprocess_standard_result
        end

        it 'is consistent when only ending separators are used' do
          output = slide_markdown.preprocess <<-eos
First
---
eos
          expect(output).to eq preprocess_standard_result
        end

        it 'can handle three slides' do
          output = slide_markdown.preprocess three_slides_in_markdown
          expect(output).to eq three_slides_after_preprocess
        end
      end

      describe '#postprocess' do
        let :three_slide_input do
          <<-eos
<div>DIVIDER</div>

<p>First</p>

<div>DIVIDER</div>

<p>Second</p>

<div>DIVIDER</div>

<p>Third</p>

<div>DIVIDER</div>
eos
        end

        it 'starts the output with a <section> and a newline' do
          output = slide_markdown.postprocess(three_slide_input)
          expect(output).to start_with "<section>\n"
        end

        it 'ends the output with a newline, a </section>, and a newline' do
          output = slide_markdown.postprocess(three_slide_input)
          expect(output).to end_with "\n</section>\n"
        end

        it 'replaces intermediate <div>DIVIDER</div>s with section breaks' do
          output = slide_markdown.postprocess(three_slide_input)
          expect(output).to eq three_slides_after_postprocess
        end
      end
    end
  end
end
