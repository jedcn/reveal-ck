require 'rake'

module RevealCK
  module Builders
    # Given a copy of reveal.js, this class knows which files should be
    # included.
    class RevealJsFiles
      attr_reader :revealjs_dir

      def initialize(args)
        @revealjs_dir = args[:revealjs_dir] || fail(':revealjs_dir is required')
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
        FileList["#{revealjs_dir}/css/reveal.min.css",
                 "#{revealjs_dir}/css/print/*",
                 "#{revealjs_dir}/css/theme/*.css"]
      end

      def js
        FileList["#{revealjs_dir}/js/reveal.min.js"]
      end

      def lib
        FileList["#{revealjs_dir}/lib/**/*.css",
                 "#{revealjs_dir}/lib/font/*",
                 "#{revealjs_dir}/lib/**/*.js"]
      end

      def plugin
        FileList["#{revealjs_dir}/plugin/**/*.js"]
      end

      def meta
        FileList["#{revealjs_dir}/README.md",
                 "#{revealjs_dir}/LICENSE",
                 "#{revealjs_dir}/package.json"]
      end

      def index
        FileList["#{revealjs_dir}/index.html"]
      end
    end

  end

end
