require 'rake'

module RevealCK
  module Builders
    # Given a location to a user's files, this class knows which files
    # should be included.
    class UserFiles
      include Retrieve
      attr_reader :dir

      def initialize(args)
        @dir = retrieve(:dir, args)
      end

      def files
        []
          .concat(css)
          .concat(js)
          .concat(plugin)
          .concat(media)
          .concat(images)
      end

      private

      def css
        FileList["#{dir}/css/**/*"]
      end

      def js
        FileList["#{dir}/js/**/*"]
      end

      def plugin
        FileList["#{dir}/plugin/**/*"]
      end

      def media
        FileList["#{dir}/media/**/*"]
      end

      def images
        FileList["#{dir}/images/**/*"]
      end
    end
  end
end
