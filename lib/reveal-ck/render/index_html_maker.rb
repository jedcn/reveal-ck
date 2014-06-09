require 'tilt'

module RevealCK
  module Render
    # An IndexHtml is made by composed head, body, and script.
    module IndexHtmlMaker
      def head
        head_html_erb = RevealCK.path_to('templates',
                                         'reveal.js',
                                         'head.html.erb')
        template = Tilt.new(head_html_erb)
        template.render(self)
      end

      def body(slides_html)
        body_html_erb = RevealCK.path_to('templates',
                                         'reveal.js',
                                         'body.html.erb')
        template = Tilt.new(body_html_erb)
        locals = {
          slides_html: slides_html
        }
        template.render(self, locals)
      end

      def script
        script_js_erb = RevealCK.path_to('templates',
                                         'reveal.js',
                                         'script.js.erb')
        template = Tilt.new(script_js_erb)
        template.render(self)
      end
    end
  end
end
