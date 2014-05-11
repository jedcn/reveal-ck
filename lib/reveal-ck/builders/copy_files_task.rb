module RevealCK
  module Builders
    # Copy a listing of files from one location to another
    class CopyFilesTask < CreationTask
      attr_reader :file_listing, :output_dir

      def initialize(args)
        @file_listing = retrieve(:file_listing, args)
        @output_dir = retrieve(:output_dir, args)
        super
      end

      def setup
        file_listing.files.each do |file|
          analyze_file(file) unless File.directory?(file)
        end
      end

      def analyze_file(file)
        dest = file.pathmap("%{^#{file_listing.dir}/,#{output_dir}/}p")
        copy_file(file, dest)
        dest_dir = dest.pathmap('%d')
        create_directory(dest_dir)
        things_to_create.add(dest_dir)
        things_to_create.add(dest)
      end
    end
  end
end
