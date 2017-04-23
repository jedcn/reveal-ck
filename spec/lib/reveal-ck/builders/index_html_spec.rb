require 'spec_helper'

module RevealCK
  module Builders
    describe IndexHtml do
      let(:version) { RevealCK::VERSION }
      let :index_html_erb do
        RevealCK.template_path('index.html',
                               'index.html.erb')
      end

      let :slides_html do
        spec_data('builders', 'index_html', 'slides.html')
      end

      let :head_prefix do
        'head_prefix'
      end

      let :config do
        config = Config.new
        config.title = 'Sample Title'
        config.description = 'Sample Description'
        config.author = 'Sample Author'
        config.theme = 'night'
        config.transition = 'page'
        config
      end

      let :index_html do
        IndexHtml.new(template: index_html_erb,
                      slides_html: slides_html,
                      head_prefix: head_prefix,
                      config: config)
      end

      let :rendered_content do
        index_html.render
      end

      it 'is created with a file location and a config' do
        expect(index_html.template).to include 'index.html.erb'
        expect(index_html.config.title).to eq config.title
      end

      it 'can render html' do
        expect(rendered_content)
          .to include('<html lang="en">')
      end

      it 'can render a <head with a prefix' do
        expect(rendered_content)
          .to include('<head prefix="head_prefix">')
      end

      it 'prints the program name and version in the generator tag' do
        expect(rendered_content)
          .to include(%(<meta name="generator" content="reveal-ck #{version}">))
      end

      it 'supports replacing the configured title' do
        expect(rendered_content)
          .to include('<title>Sample Title</title>')
      end

      it 'support replacing the configured description' do
        expect(rendered_content)
          .to include('<meta name="description" content="Sample Description">')
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
