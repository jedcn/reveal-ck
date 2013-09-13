require 'spec_helper'
require 'tmpdir'

module RevealCK
  describe PresentationBuilder do

    let :presentation do
      presentation = Presentation.new
      presentation.title = "Presentation Title"
      presentation.author = "Presentation Author"

      presentation.add_slide(Slide.new({
                                        template: 'title',
                                        title:    presentation.title,
                                        author:   presentation.author,
                                        site:     'http://site.com',
                                        twitter:  'twitter'
                                       }))
      presentation
    end

    it 'can build reveal.js slides from a Presentation' do

      tmp_dir = Dir.mktmpdir

      presentation_builder = PresentationBuilder.new({
                                                       presentation: presentation,
                                                       output_dir: tmp_dir,
                                                     })
      presentation_builder.build!

      expect(File.exists? File.join(tmp_dir, "index.html")).to be_true
    end

  end
end
