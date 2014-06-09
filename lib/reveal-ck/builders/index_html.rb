require 'tilt'

module RevealCK
  module Builders
    #
    # Public: An IndexHtml knows how to build the index.html file (the
    # core slides) within a reveal.js presentation.
    #
    class IndexHtml
      include Retrieve

      attr_reader :index_file, :slides_html, :config

      def initialize(args)
        @index_file = retrieve(:index_file, args)
        @slides_html = retrieve(:slides_html, args)
        @config = retrieve(:config, args)
      end

      def render
        scope = RevealCK::Render::Scope.new(dir: Dir.pwd, config: config)
        template = Tilt.new(index_file)
        locals = {
          slides_html: slides_html
        }
        template.render(scope, locals)
      end
    end
  end
end
