require 'spec_helper'

module RevealCK
  describe Slide do

    let :title_slide do
      Slide.new template: 'title',
                title: 'Reveal.js',
                subtitle: 'HTML Presentations Made Easy',
                author: 'Hakim El Hattab',
                site: 'http://hakim.se',
                twitter: 'hakimel'
    end

    it 'can use templates embedded within this gem' do
      output = title_slide.output
      expect(output).to include 'Reveal.js'
    end

  end
end
