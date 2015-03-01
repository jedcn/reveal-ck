require 'spec_helper'
require 'tmpdir'
require 'rake'

module RevealCK
  module Builders
    describe CreateSlidesHtml do
      it 'creates a transformed slides file' do
        Dir.mktmpdir do |dir|
          Dir.chdir(dir) do
            slides_file_initial = 'slides-initial.md'
            File.open(slides_file_initial, 'w') do |file|
              file.puts('# Slides')
            end

            application = Rake::Application.new
            slides_html =
              CreateSlidesHtml.new(slides_file: slides_file_initial,
                                   output_dir: dir,
                                   config: Config.new,
                                   application: application)

            slides_html.prepare
            application['create_slides_html'].invoke

            expect(File.exist?('slides.html')).to be true
            content = File.open('slides.html', 'r').read
            expect(content).to include '<h1>Slides</h1>'
          end
        end
      end

      it 'can transform emoji' do
        Dir.mktmpdir do |dir|
          Dir.chdir(dir) do
            slides_file_initial = 'slides-initial.md'
            File.open(slides_file_initial, 'w') do |file|
              file.puts('# I :heart: Slides')
            end

            config = Config.new
            config.filters = ['HTML::Pipeline::RevealCKEmojiFilter']
            application = Rake::Application.new
            slides_html =
              CreateSlidesHtml.new(slides_file: slides_file_initial,
                                   output_dir: dir,
                                   config: config,
                                   application: application)

            slides_html.prepare
            application['create_slides_html'].invoke
            content = File.open('slides.html', 'r').read
            expect(content).to include 'emoji/unicode/2764.png'
          end
        end
      end
    end
  end
end
