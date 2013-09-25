require 'spec_helper'
require 'tempfile'

module RevealCK
  module Builders
    describe SlidesHtml do

      let :data do
        File.join 'spec', 'data', 'slides_html_builder'
      end

      context 'when working with slim' do

        let :input_file do
          File.join data, 'slides.slim'
        end

        describe '#render' do
          it 'knows how to create slide content from slim' do
            builder = SlidesHtml.new input_file: input_file
            expect(builder.render).to include "<section>"
            expect(builder.render).to include "<h1>"
            expect(builder.render).to include "Hello Slim!"
          end
        end

      end

      context 'when working with haml' do

        let :input_file do
          File.join data, 'slides.haml'
        end

        describe '#render' do
          it 'knows how to create slide content from haml' do
            builder = SlidesHtml.new input_file: input_file
            expect(builder.render).to include "<section>"
            expect(builder.render).to include "<h1>"
            expect(builder.render).to include "Hello Haml!"
          end
        end

      end

      context 'when working with ruby' do

        let :input_file do
          File.join data, 'slides.rb'
        end

        describe '#render' do
          it 'knows how to create slide content from ruby' do
            builder = SlidesHtml.new input_file: input_file
            expect(builder.render).to include "<section>"
            expect(builder.render).to include "<h2>"
            expect(builder.render).to include "Hello Ruby!"
          end
        end

      end

      context 'when working with a Presentation' do

        let :presentation do
          quote = Slide.new({
                              template: 'quote',
                              content:  'Hello Ruby!',
                              citation: 'https://www.ruby-lang.org/en/about/'
                            })
          presentation = Presentation.new
          presentation.add_slide quote
          presentation
        end

        describe '#render' do
          it 'knows how to create slide content from a Presentation' do
            builder = SlidesHtml.new presentation: presentation
            expect(builder.render).to include "<section>"
            expect(builder.render).to include "<blockquote"
            expect(builder.render).to include "Hello Ruby!"
          end
        end

      end

      describe '#write_to' do

        it 'can write #rendered output to a file' do
          input_file = File.join data, 'slides.haml'
          builder = SlidesHtml.new input_file: input_file
          tmp_file = Tempfile.new 'slides.html'
          builder.write_to file: tmp_file.path

          written_content = File.open(tmp_file).read
          expect(written_content).to include "<section>"
          expect(written_content).to include "<h1>"
          expect(written_content).to include "Hello Haml!"
        end

      end
    end
  end
end
