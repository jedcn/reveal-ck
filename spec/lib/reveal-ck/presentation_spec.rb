require 'spec_helper'

module RevealCK
  describe Presentation do

    let :config do
      Config.new
    end

    let :presentation do
      presentation = Presentation.new config: config
      presentation.add double('content', html: 'first')
      presentation.add double('content', html: 'second')
      presentation
    end

    let :html do
      presentation.html
    end

    describe '#add' do
      it 'adds to a growing list of html' do
        expect(html).to include 'first'
        expect(html).to include 'second'
        expect(html.strip).to start_with 'first'
        expect(html.strip).to end_with 'second'
      end
    end

    describe '#html' do
      it 'returns the html, in order, added so far' do
        expect(html).to start_with 'first'
        expect(html).to end_with 'second'
      end
    end

    let :slides_haml do
      spec_data 'presentation', 'slides.haml'
    end

    describe '.from_template' do
      it 'loads presentation html from a template' do
        presentation = Presentation.from_template(file: slides_haml,
                                                  config: config)
        html = presentation.html
        expect(html).to start_with '<section>'
        expect(html).to include 'slides.haml'
        expect(html).to include '</section>'
      end
    end

    let :slides_rb do
      spec_data 'presentation', 'slides.rb'
    end

    describe '.from_dsl' do
      it 'loads presentation html and metadata from a dsl' do
        presentation = Presentation.from_dsl file: slides_rb, config: config
        html = presentation.html
        expect(html).to start_with '<section>'
        expect(html).to include 'slides.rb'
        expect(html).to include '</section>'
        expect(presentation.theme).to eq 'night'
      end
    end

    describe '.load' do
      it 'can work with a .rb file' do
        presentation = Presentation.load file: slides_rb, config: config
        html = presentation.html
        expect(html).to start_with '<section>'
      end
    end

    describe '.load' do
      it 'can work with a template file' do
        presentation = Presentation.load file: slides_haml, config: config
        html = presentation.html
        expect(html).to start_with '<section>'
      end
    end

  end
end
