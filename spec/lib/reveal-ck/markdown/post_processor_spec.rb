require 'spec_helper'

module RevealCK
  module Markdown
    describe PostProcessor do
      context 'without vertical slides' do

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

        let :three_slides_output do
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

        it 'starts the output with a <section> and a newline' do
          output = PostProcessor.new(three_slide_input).process
          expect(output).to start_with "<section>\n"
        end

        it 'ends the output with a newline, a </section>, and a newline' do
          output = PostProcessor.new(three_slide_input).process
          expect(output).to end_with "\n</section>\n"
        end

        it 'replaces intermediate <div>DIVIDER</div>s with section breaks' do
          output = PostProcessor.new(three_slide_input).process
          expect(output).to eq three_slides_output
        end
      end

      context 'with vertical slides' do

        let :single_vertical_input do
          <<-eos
<div>VERTICAL_START</div>

First

<div>DIVIDER</div>

Second

<div>DIVIDER</div>

Third

<div>VERTICAL_END</div>
eos
        end

        let :single_vertical_output do
          <<-eos
<section>
<section>

First

</section>
<section>

Second

</section>
<section>

Third

</section>
</section>
eos
        end

        it 'starts the output with two <section>s' do
          output = PostProcessor.new(single_vertical_input).process
          expect(output).to start_with "<section>\n"
        end

        it 'ends the output a newline, two </section>s, and a newline' do
          output = PostProcessor.new(single_vertical_input).process
          expect(output).to end_with "\n</section>\n</section>\n"
        end

        it 'separates the "internal" slides correctly' do
          output = PostProcessor.new(single_vertical_input).process
          expect(output).to eq single_vertical_output
        end
      end
    end
  end
end
