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

        let :single_vertical_output do
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

        context 'single vertical slide' do
          it 'handles situation with no "closing" vertical' do
            unbalanced_vertical_markdown = <<-eos
***
First
---
Second
---
Third
eos
            output = PreProcessor.new(unbalanced_vertical_markdown).process
            expect(output).to eq single_vertical_output
          end

          it 'handles situation with a "closing" vertical' do
            balanced_vertical_markdown = <<-eos
***
First
---
Second
---
Third
***
eos

            output = PreProcessor.new(balanced_vertical_markdown).process
            expect(output).to eq single_vertical_output
          end
        end

        context 'horizontal and vertical combinations' do
          it 'handles vertical slides surrounded by horizontals' do
            vertical_surrounded_by_horizontal = <<-eos
First
***
Vertical 1
---
Vertical 2
---
Vertical 3
***
Last
eos
            output = PreProcessor.new(vertical_surrounded_by_horizontal).process
            expect(output).to eq <<-eos
<div>DIVIDER</div>

First

<div>VERTICAL_START</div>

Vertical 1

<div>DIVIDER</div>

Vertical 2

<div>DIVIDER</div>

Vertical 3

<div>VERTICAL_END</div>

Last

<div>DIVIDER</div>
eos
          end

          it 'handles back-to-back vertical slides surrounded by horizontals' do
            vertical_surrounded_by_horizontal = <<-eos
First
***
Vertical A1
---
Vertical A2
---
Vertical A3
***
***
Vertical B1
---
Vertical B2
---
Vertical B3
***
Last
eos
            output = PreProcessor.new(vertical_surrounded_by_horizontal).process
            expect(output).to eq <<-eos
<div>DIVIDER</div>

First

<div>VERTICAL_START</div>

Vertical A1

<div>DIVIDER</div>

Vertical A2

<div>DIVIDER</div>

Vertical A3

<div>VERTICAL_END</div>


<div>VERTICAL_START</div>

Vertical B1

<div>DIVIDER</div>

Vertical B2

<div>DIVIDER</div>

Vertical B3

<div>VERTICAL_END</div>

Last

<div>DIVIDER</div>
eos
          end

          it 'handles multiple vertical slides surrounded by horizontals' do
            vertical_surrounded_by_horizontal = <<-eos
First
***
Vertical A1
---
Vertical A2
---
Vertical A3
***
Middle
***
Vertical B1
---
Vertical B2
---
Vertical B3
***
Last
eos
            output = PreProcessor.new(vertical_surrounded_by_horizontal).process
            expect(output).to eq <<-eos
<div>DIVIDER</div>

First

<div>VERTICAL_START</div>

Vertical A1

<div>DIVIDER</div>

Vertical A2

<div>DIVIDER</div>

Vertical A3

<div>VERTICAL_END</div>

Middle

<div>VERTICAL_START</div>

Vertical B1

<div>DIVIDER</div>

Vertical B2

<div>DIVIDER</div>

Vertical B3

<div>VERTICAL_END</div>

Last

<div>DIVIDER</div>
eos
          end
        end
      end
    end
  end
end
