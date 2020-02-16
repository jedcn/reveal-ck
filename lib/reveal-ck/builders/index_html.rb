require 'tilt'

module RevealCK
  module Builders
    #
    # Public: An IndexHtml knows how to build the index.html file (the
    # core slides) within a reveal.js presentation.
    #
    class IndexHtml
      include Retrieve

      attr_reader :template, :slides_html, :config

      def initialize(args)
        @template = retrieve(:template, args)
        @slides_html = retrieve(:slides_html, args)
        @config = retrieve(:config, args)
      end

      def render
        scope = RevealCK::Render::Scope.new(dir: Dir.pwd, config: config)
        tilt_template = Tilt.new(template)
        locals = {
          slides_html: slides_html
        }
        tilt_template.render(scope, locals)
      end
    end
  end
end
