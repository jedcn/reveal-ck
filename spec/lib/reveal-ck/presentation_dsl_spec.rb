require 'spec_helper'

module RevealCK
  describe PresentationDSL do
    let :config do
      Config.new
    end

    let :dsl_file do
      spec_data 'presentation_dsl', 'dsl.rb'
    end

    let :presentation do
      PresentationDSL.load file: dsl_file, config: config
    end

    describe '.load' do
      it 'can build a RevealCK::Presentation from a file' do
        result = PresentationDSL.load file: dsl_file, config: config
        expect(result).to be_a Presentation
      end
    end

    describe 'A Presentation loaded from a dsl' do
      let :html do
        presentation.html
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

      it 'retains the revealjs config options in the dsl file' do
        auto_slide_value = presentation.revealjs_config['autoSlide']
        expect(auto_slide_value).to eq 5000
      end

      it 'retains the slides defined in the dsl file' do
        expect(html).to include 'Hello World'
        expect(html).to include 'Thanks!'
        expect(html).to include 'module RevealCK'
      end
    end
  end
end
