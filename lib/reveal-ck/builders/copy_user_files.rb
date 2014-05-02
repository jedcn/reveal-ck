module RevealCK
  module Builders
    # Given a location of the user's reveal-ck files, a Rake
    # application, and a place where everything should end up, this
    # class knows how to work with Rake and build up a presentation
    # with the user's stuff.
    class CopyUserFiles < CreationTask
      attr_reader :user_files_dir, :output_dir

      def initialize(args)
        @user_files_dir = retrieve(:user_files_dir, args)
        @output_dir = retrieve(:output_dir, args)
        super
      end

      def name
        'copy_user_files'
      end

      def setup
        files = UserFiles.new(user_files_dir: user_files_dir)
        files.all.each do |file|
          analyze_file(file) unless File.directory?(file)
        end
      end

      def analyze_file(src)
        dest = src.pathmap("%{^#{user_files_dir}/,#{output_dir}/}p")
        copy_file(src, dest)
        dir = dest.pathmap('%d')
        create_directory(dir)
        things_to_create.add(dir)
        things_to_create.add(dest)
      end
    end
  end
end
