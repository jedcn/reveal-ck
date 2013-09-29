require 'spec_helper'

module RevealCK
  describe Presentation do

    let :presentation do
      presentation = Presentation.new
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

    describe '#theme' do
      it 'can be set and read' do
        presentation = Presentation.new
        presentation.theme = 'night'
        expect(presentation.theme).to eq 'night'
      end

      it 'has a default value of "default"' do
        expect(Presentation.new.theme).to eq 'default'
      end
    end

    describe '#transition' do
      it 'can be set and read' do
        presentation = Presentation.new
        presentation.transition = 'page'
        expect(presentation.transition).to eq 'page'
      end

      it 'has a default value of "default"' do
        expect(Presentation.new.transition).to eq 'default'
      end
    end

    describe '#title' do
      it 'can be set and read' do
        presentation = Presentation.new
        presentation.title = 'My Title'
        expect(presentation.title).to eq 'My Title'
      end

      it 'has a default value of ""' do
        expect(Presentation.new.title).to eq ''
      end
    end

    describe '#author' do
      it 'can be set and read' do
        presentation = Presentation.new
        presentation.author = 'Me'
        expect(presentation.author).to eq 'Me'
      end

      it 'has a default value of ""' do
        expect(Presentation.new.author).to eq ''
      end
    end

    let :slides_haml do
      spec_data 'presentation', 'slides.haml'
    end

    describe '.from_template' do
      it 'loads presentation html from a template' do
        presentation = Presentation.from_template slides_haml
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
        presentation = Presentation.from_dsl slides_rb
        html = presentation.html
        expect(html).to start_with '<section>'
        expect(html).to include 'slides.rb'
        expect(html).to include '</section>'
        expect(presentation.theme).to eq 'night'
      end
    end

  end
end
