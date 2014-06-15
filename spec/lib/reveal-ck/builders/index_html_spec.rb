require 'spec_helper'

module RevealCK
  module Builders
    describe IndexHtml do
      let :index_html_erb do
        File.join(Dir.pwd, 'files', 'reveal-ck',
                  'templates', 'index.html',
                  'index.html.erb')
      end

      let :slides_html do
        spec_data('builders', 'index_html', 'slides.html')
      end

      let :config do
        config = Config.new
        config.title = 'Sample Title'
        config.author = 'Sample Author'
        config.theme = 'night'
        config.transition = 'page'
        config
      end

      let :index_html do
        IndexHtml.new(index_file: index_html_erb,
                      slides_html: slides_html,
                      config: config)
      end

      let :rendered_content do
        index_html.render
      end

      it 'is created with a file location and a config' do
        expect(index_html.index_file).to include 'index.html.erb'
        expect(index_html.config.title).to eq config.title
      end

      it 'can render html' do
        expect(rendered_content)
          .to include('<html lang="en">')
      end

      it 'supports replacing the configured title' do
        expect(rendered_content)
          .to include('<title>Sample Title</title>')
      end

      it 'supports replacing the configured author' do
        expect(rendered_content)
          .to include('<meta name="author" content="Sample Author">')
      end

      it 'supports replacing the configured theme' do
        expect(rendered_content)
          .to include('<link rel="stylesheet" href="css/theme/night.css"')
      end

      it 'supports replacing the configured transition' do
        expect(rendered_content)
          .to include("transition: 'page'")
      end

      it 'supports replacing the associated slides' do
        expect(rendered_content)
          .to include('This is a slide')
      end
    end
  end
end
