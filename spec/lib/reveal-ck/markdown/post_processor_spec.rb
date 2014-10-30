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
    end
  end
end
