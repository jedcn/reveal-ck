require 'spec_helper'

module RevealCK
  module Commands
    describe Generate do
      describe '#run' do
        it 'generates a new set of slides' do
          slides_builder = double
          allow(RevealCK::Builders::SlidesBuilder)
            .to receive(:new)
            .and_return(slides_builder)

          expect(slides_builder).to receive(:prepare)
          expect(slides_builder).to receive(:build)

          generate =
            Generate.new(user_dir: 'user_dir',
                         gem_dir: 'gem_dir',
                         output_dir: 'output_dir',
                         slides_file: 'slides_file')
          generate.run
        end
      end
    end
  end
end
