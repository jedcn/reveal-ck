require 'rake'

module RevealCK
  module Builders
    # Given a copy of reveal.js, this class knows which files should be
    # included.
    class RevealJsFiles
      include Retrieve
      attr_reader :reveal_js_dir
      def initialize(args)
        @reveal_js_dir = retrieve(:reveal_js_dir, args)
      end

      def all
        []
          .concat(css)
          .concat(js)
          .concat(lib)
          .concat(plugin)
          .concat(meta)
          .concat(index)
      end

      private

      def css
        FileList["#{reveal_js_dir}/css/reveal.min.css",
                 "#{reveal_js_dir}/css/print/*",
                 "#{reveal_js_dir}/css/theme/*.css"]
      end

      def js
        FileList["#{reveal_js_dir}/js/reveal.min.js"]
      end

      def lib
        FileList["#{reveal_js_dir}/lib/**/*.css",
                 "#{reveal_js_dir}/lib/font/*",
                 "#{reveal_js_dir}/lib/**/*.js"]
      end

      def plugin
        FileList["#{reveal_js_dir}/plugin/**/*.js"]
      end

      def meta
        FileList["#{reveal_js_dir}/README.md",
                 "#{reveal_js_dir}/LICENSE",
                 "#{reveal_js_dir}/package.json"]
      end

      def index
        FileList["#{reveal_js_dir}/index.html"]
      end
    end
  end
end
