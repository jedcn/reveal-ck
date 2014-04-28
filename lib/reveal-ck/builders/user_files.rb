require 'rake'

module RevealCK
  module Builders
    # Given a location to a user's files, this class knows which files
    # should be included.
    class UserFiles
      attr_reader :user_files_dir

      def initialize(args)
        @user_files_dir = args[:user_files_dir] || fail(':user_files_dir is required')
      end

      def all
        []
          .concat(css)
          .concat(js)
          .concat(plugin)
          .concat(media)
          .concat(images)
      end

      private

      def css
        FileList["#{user_files_dir}/css/**/*"]
      end

      def js
        FileList["#{user_files_dir}/js/**/*"]
      end

      def plugin
        FileList["#{user_files_dir}/plugin/**/*"]
      end

      def media
        FileList["#{user_files_dir}/media/**/*"]
      end

      def images
        FileList["#{user_files_dir}/images/**/*"]
      end
    end

  end

end
