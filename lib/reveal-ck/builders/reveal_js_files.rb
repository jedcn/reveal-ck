require 'rake'

module RevealCK
  module Builders
    # Given a copy of reveal.js, this class knows which files are
    # vital to the presentation.
    class RevealJsFiles
      include Retrieve

      attr_reader :dir

      def initialize(args)
        @dir = retrieve(:dir, args)
      end

      def files
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
        FileList["#{dir}/css/reveal.min.css",
                 "#{dir}/css/print/*",
                 "#{dir}/css/theme/*.css"]
      end

      def js
        FileList["#{dir}/js/reveal.min.js"]
      end

      def lib
        FileList["#{dir}/lib/**/*.css",
                 "#{dir}/lib/font/*",
                 "#{dir}/lib/**/*.js"]
      end

      def plugin
        FileList["#{dir}/plugin/**/*.js"]
      end

      def meta
        FileList["#{dir}/README.md",
                 "#{dir}/LICENSE",
                 "#{dir}/package.json"]
      end

      def index
        FileList["#{dir}/index.html"]
      end
    end
  end
end
