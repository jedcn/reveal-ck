require 'spec_helper'
require 'tmpdir'

module RevealCK
  module Builders
    describe SlidesBuilder do
      it 'creates a reveal.js presentation' do
        Dir.mktmpdir do |dir|
          Dir.chdir(dir) do

            slides_file = 'slides.md'
            File.open(slides_file, 'w') do |file|
              file.puts('# Slides')
            end

            File.open('config.yml', 'w') do |file|
              file.puts('author: Configured Author')
            end

            FileUtils.mkdir('css')
            custom_css = File.join('css', 'custom.css')
            File.open(custom_css, 'w') do |file|
              file.puts('body { background: "red" }')
            end

            args = {
              reveal_js_dir: RevealCK.path_to('reveal.js'),
              reveal_ck_dir: dir,
              output_dir: 'presentation',
              slides_file: slides_file
            }

            slides_builder =
              RevealCK::Builders::SlidesBuilder.new(args)
            slides_builder.prepare
            slides_builder.build

            # The output directory was created
            expect(File.directory?('presentation')).to be true

            # The slides_file was transformed into HTML, and copied
            # into the output directory at slides.html
            slides_html = File.join('presentation', 'slides.html')
            slides_html_content = File.open(slides_html, 'r').read
            expect(slides_html_content).to include '<h1>Slides</h1>'

            # The index.html was created in the output directory, and
            # it contains information that was retrieved from the
            # config.yml
            index_html = File.join('presentation', 'index.html')
            index_html_content = File.open(index_html, 'r').read
            expect(index_html_content).to include 'Configured Author'

            # reveal.js files were copied into the presentation
            reveal_js_css = File.join('presentation', 'css', 'reveal.min.css')
            expect(File.exist?(reveal_js_css)).to be true

            # The user's files were copied into the presentation
            user_css = File.join('presentation', 'css', 'custom.css')
            expect(File.exist?(user_css)).to be true
          end
        end
      end
    end
  end
end
