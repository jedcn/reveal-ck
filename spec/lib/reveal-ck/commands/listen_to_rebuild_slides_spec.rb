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
          %r{^slides/.+$}
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

          output_dir = 'slides'
          ListenToRebuildSlides.new(double('ui'), output_dir).run
        end
      end
    end
  end
end
