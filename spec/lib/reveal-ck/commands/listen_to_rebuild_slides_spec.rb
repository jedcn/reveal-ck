require 'spec_helper'
require 'listen'

module RevealCK
  module Commands
    describe ListenToRebuildSlides do
      describe '#run' do
        let :current_directory do
          '.'
        end

        let :slides_file_regex do
          /^slides.md$/
        end

        it 'sets up ::Listen to run when things change' do
          listener = double
          expect(::Listen)
            .to(receive(:to))
            .with(current_directory, only: slides_file_regex)
            .once
            .and_return(listener)
          expect(listener)
            .to(receive(:start))

          slides_file = 'slides.md'
          ListenToRebuildSlides.new(double('ui'), slides_file).run
        end
      end
    end
  end
end
