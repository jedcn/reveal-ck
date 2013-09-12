require 'spec_helper'

module RevealCK
  describe Presentation do

    describe '#add_slide' do

      it 'maintains a list of slides' do
        presentation = Presentation.new
        presentation.add_slide double('slide', html: "first")
        presentation.add_slide double('slide', html: "second")
      end

    end

    describe '#content' do

      let :presentation do
        presentation = Presentation.new
        presentation.add_slide double('slide', html: "first")
        presentation.add_slide double('slide', html: "second")
        presentation
      end

      let :content do
        presentation.content.strip
      end

      it 'returns the content from each slide' do
        expect(content).to start_with 'first'
        expect(content).to end_with 'second'
      end

    end

  end
end
