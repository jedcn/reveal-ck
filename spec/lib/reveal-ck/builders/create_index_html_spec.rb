require 'spec_helper'
require 'tmpdir'
require 'rake'

module RevealCK
  module Builders
    describe CreateIndexHtml do
      it 'creates a reveal.js index.html' do
        Dir.mktmpdir do |dir|
          Dir.chdir(dir) do

            slides_html = 'slides.html'
            File.open(slides_html, 'w') do |file|
              file.puts('<section>')
              file.puts('<h1>Slides</h1>')
              file.puts('</section>')
            end

            index_html_erb =
              RevealCK.path_to('templates/reveal.js/index.html.erb')

            application = Rake::Application.new
            create_index_html =
              CreateIndexHtml.new(slides_html: slides_html,
                                  index_html: index_html_erb,
                                  output_dir: dir,
                                  config: Config.new,
                                  application: application)

            create_index_html.prepare
            application['create_index_html'].invoke

            expect(File.exist?('index.html')).to be true
            content = File.open('index.html', 'r').read
            expect(content).to include '<h1>Slides</h1>'
          end
        end
      end
    end
  end
end
