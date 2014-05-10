require 'rake'

module RevealCK
  module Builders
    # Given a slides.html, a Rake application, and a place where the
    # final index.html file should end up, this class knows how to
    # work with Rake and create the index.html.
    class CreateIndexHtml < CreationTask
      attr_reader :slides_html, :index_html, :output_dir, :config

      def initialize(args)
        @slides_file = retrieve(:slides_html, args)
        @index_html = retrieve(:index_html, args)
        @output_dir = retrieve(:output_dir, args)
        @config = retrieve(:config, args)
        super
      end

      def setup
        index_html_file = "#{output_dir}/index.html"
        task(index_html_file => 'slides/slides.html') do
          content = IndexHtml.new(slides_file: "#{output_dir}/slides.html",
                                  index_file: index_html,
                                  config: config).render
          File.open(index_html_file, 'w') do |index_html|
            index_html.puts(content)
          end
        end
        things_to_create.add(index_html_file)
      end
    end
  end
end
