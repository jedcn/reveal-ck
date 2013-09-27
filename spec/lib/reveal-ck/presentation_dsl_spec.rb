require 'spec_helper'

module RevealCK
  describe PresentationDSL do

    let :dsl_file do
      spec_data 'presentation_dsl', 'dsl.rb'
    end

    let :presentation do
      PresentationDSL.load dsl_file
    end

    describe '.load' do
      it 'can build a RevealCK::Presentation from a file' do
        result = PresentationDSL.load dsl_file
        expect(result).to be_a Presentation
      end
    end

    describe 'A Presentation loaded from a dsl' do

      let :content do
        presentation.content
      end

      it 'retains the author in the dsl file' do
        expect(presentation.author).to eq 'Presentation Author'
      end

      it 'retains the theme in the dsl file' do
        expect(presentation.theme).to eq 'night'
      end

      it 'retains the title in the dsl file' do
        expect(presentation.title).to eq 'Presentation Title'
      end

      it 'retains the transition in the dsl file' do
        expect(presentation.transition).to eq 'page'
      end

      it 'retains the slides defined in the dsl file' do
        expect(content).to include 'Hello World'
        expect(content).to include 'Thanks!'
      end
    end
  end
end
