require 'tilt'

module RevealCK
  module Render
    # An IndexHtml is made by composed head, body, and script.
    module IndexHtmlMaker
      def index_head
        index_head_html_erb = RevealCK.path_to('templates',
                                               'reveal.js',
                                               'index_head.html.erb')
        template = Tilt.new(index_head_html_erb)
        template.render(self)
      end

      def index_body(slides_html)
        index_body_html_erb = RevealCK.path_to('templates',
                                               'reveal.js',
                                               'index_body.html.erb')
        template = Tilt.new(index_body_html_erb)
        locals = {
          slides_html: slides_html
        }
        template.render(self, locals)
      end

      def index_script
        init_js_erb = RevealCK.path_to('templates',
                                       'reveal.js',
                                       'index_script.js.erb')
        template = Tilt.new(init_js_erb)
        template.render(self)
      end
    end
  end
end
