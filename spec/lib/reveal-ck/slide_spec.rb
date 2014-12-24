require 'spec_helper'

module RevealCK
  describe Slide do
    let :intro_slide do
      Slide.new template: 'intro',
                title: 'Reveal.js',
                subtitle: 'HTML Presentations Made Easy',
                author: 'Hakim El Hattab',
                site: 'http://hakim.se',
                twitter: 'hakimel'
    end

    describe '#html' do
      it 'produces html output' do
        output = intro_slide.html
        expect(output).to include 'Reveal.js'
      end
    end
  end
end
