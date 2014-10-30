require 'spec_helper'

module RevealCK
  module Markdown
    describe PreProcessor do

      let :standard_result do
        <<-eos
<div>DIVIDER</div>

First

<div>DIVIDER</div>
eos
      end

      context 'without vertical slides' do
        it 'wraps a document with <div>DIVIDER</div>s' do
          input = 'First'
          output = PreProcessor.new(input).process
          expect(output).to eq standard_result
        end

        it 'is consistent when starting+ending separators are used' do
          input =  <<-eos
---
First
---
eos
          output = PreProcessor.new(input).process
          expect(output).to eq standard_result
        end

        it 'is consistent when only starting separators are used' do
          input = <<-eos
---
First
eos
          output = PreProcessor.new(input).process
          expect(output).to eq standard_result
        end

        it 'is consistent when only ending separators are used' do
          input = <<-eos
First
---
eos
          output = PreProcessor.new(input).process
          expect(output).to eq standard_result
        end


        let :three_slides_input do
          <<-eos
First
---
Second
---
Third
eos
        end

        let :three_slides_output do
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

        it 'can handle three slides' do
          input = three_slides_input
          output = PreProcessor.new(input).process
          expect(output).to eq three_slides_output
        end
      end

      context 'with vertical slides' do

        it 'can handle initially vertical slides' do
          initially_vertical_markdown = <<-eos
***
First
---
Second
---
Third
eos

          output = PreProcessor.new(initially_vertical_markdown).process
          expect(output).to eq <<-eos
<div>VERTICAL</div>

First

<div>DIVIDER</div>

Second

<div>DIVIDER</div>

Third

<div>VERTICAL</div>
eos
        end
      end
    end
  end
end
