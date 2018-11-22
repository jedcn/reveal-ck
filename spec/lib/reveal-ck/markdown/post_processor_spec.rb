require 'spec_helper'

module RevealCK
  module Markdown
    describe PostProcessor do
      it 'unprotects emojis' do
        input = ':moneyEUwithEUwings:'
        output = PostProcessor.new(input).process
        expect(output).to include ':money_with_wings:'

        input = ':blueEUheart:'
        output = PostProcessor.new(input).process
        expect(output).to include ':blue_heart:'

        input = ':non-potableEUwater:'
        output = PostProcessor.new(input).process
        expect(output).to include ':non-potable_water:'
      end

      context 'handling notes' do
        let :transformed_notes do
          <<-HTML.strip_heredoc
          <div>DIVIDER</div>


          <div>NOTES_OPEN</div>

          This is a note

          <div>NOTES_CLOSE</div>


          <div>DIVIDER</div>
          HTML
        end

        it 'translates <div>NOTES_OPEN</div> into <aside class="notes">' do
          output = PostProcessor.new(transformed_notes).process
          expect(output).to include "\n<aside class=\"notes\">\n"
        end

        it 'translates <div>NOTES_CLOSE</div> into </aside>' do
          output = PostProcessor.new(transformed_notes).process
          expect(output).to include "\n</aside>\n"
        end
      end

      context 'without vertical slides' do
        let :three_slide_input do
          <<-HTML.strip_heredoc
          <div>DIVIDER</div>

          <p>First</p>

          <div>DIVIDER</div>

          <p>Second</p>

          <div>DIVIDER</div>

          <p>Third</p>

          <div>DIVIDER</div>
          HTML
        end

        let :three_slides_output do
          <<-HTML.strip_heredoc
          <section>

          <p>First</p>

          </section>
          <section>

          <p>Second</p>

          </section>
          <section>

          <p>Third</p>

          </section>
          HTML
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
        context 'single vertical slide' do
          let :single_vertical_input do
            <<-HTML.strip_heredoc
            <div>VERTICAL_START</div>

            First

            <div>DIVIDER</div>

            Second

            <div>DIVIDER</div>

            Third

            <div>VERTICAL_END</div>
            HTML
          end

          let :single_vertical_output do
            <<-HTML.strip_heredoc
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
            HTML
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

        context 'back-to-back vertical slides' do
          let :double_vertical_input do
            <<-HTML.strip_heredoc
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
            HTML
          end

          let :double_vertical_output do
            <<-HTML.strip_heredoc
            <section>
            <section>

            Vertical A1

            </section>
            <section>

            Vertical A2

            </section>
            <section>

            Vertical A3

            </section>
            </section>

            <section>
            <section>

            Vertical B1

            </section>
            <section>

            Vertical B2

            </section>
            <section>

            Vertical B3

            </section>
            </section>
            HTML
          end

          it 'creates two columns of sections' do
            output = PostProcessor.new(double_vertical_input).process
            expect(output).to eq double_vertical_output
          end
        end

        context 'horizontal and vertical combinations' do
          let :verticals_surrounded_by_horizontals_input do
            <<-HTML.strip_heredoc
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
            HTML
          end

          let :verticals_surrounded_by_horizontals_output do
            <<-HTML.strip_heredoc
            <section>

            First

            </section>
            <section>
            <section>

            Vertical A1

            </section>
            <section>

            Vertical A2

            </section>
            <section>

            Vertical A3

            </section>
            </section>
            <section>

            Middle

            </section>
            <section>
            <section>

            Vertical B1

            </section>
            <section>

            Vertical B2

            </section>
            <section>

            Vertical B3

            </section>
            </section>
            <section>

            Last

            </section>
            HTML
          end

          it 'creates a slide, a column, a slide, a column, and a slide' do
            processor =
              PostProcessor.new(verticals_surrounded_by_horizontals_input)
            output = processor.process
            expect(output).to eq verticals_surrounded_by_horizontals_output
          end
        end
      end
    end
  end
end
