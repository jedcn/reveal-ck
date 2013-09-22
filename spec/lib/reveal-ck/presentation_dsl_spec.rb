require 'spec_helper'

module RevealCK
  describe PresentationDSL do

    let :dsl_file do
      File.join 'spec', 'data', 'dsl', 'slides.rb'
    end

    let :presentation do
      PresentationDSL.load dsl_file
    end

    describe '#load' do
      it 'can build a RevealCK::Presentation from a file' do
        result = PresentationDSL.load dsl_file
        expect(result).to be_a Presentation
      end
    end

    describe '.author' do
      it 'defines the author in the Presentation' do
        expect(presentation.author).to eq 'Presentation Author'
      end
    end

    describe '.theme' do
      it 'defines the theme in the Presentation' do
        expect(presentation.theme).to eq 'night'
      end
    end

    describe '.title' do
      it 'defines the title in the Presentation' do
        expect(presentation.title).to eq 'Presentation Title'
      end
    end

  end
end
