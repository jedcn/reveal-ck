require 'spec_helper'
require 'listen'

module RevealCK
  module Commands
    describe ListenToRebuildSlides do
      describe '#run' do

        let :current_directory do
          '.'
        end

        let :generated_slides do
          /^slides\/.+$/
        end

        it 'sets up ::Listen to run when things change' do
          listener = double
          expect(::Listen)
            .to(receive(:to))
            .with(current_directory, ignore: generated_slides)
            .once
            .and_return(listener)
          expect(listener)
            .to(receive(:start))

          ListenToRebuildSlides.new(double('ui')).run
        end
      end
    end
  end
end
