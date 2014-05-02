require 'rake'

module RevealCK
  module Builders
    # Given a copy of reveal.js, a Rake application, and a place where
    # everything should end up, this class knows how to work with Rake and
    # build up a presentation with the needed reveal.js stuff.
    class CopyRevealJs < CreationTask
      attr_reader :reveal_js_dir, :output_dir

      def initialize(args)
        @reveal_js_dir = retrieve(:reveal_js_dir, args)
        @output_dir = retrieve(:output_dir, args)
        super
      end

      def name
        'copy_reveal_js'
      end

      def setup
        files = RevealJsFiles.new(reveal_js_dir: reveal_js_dir)
        files.all.each { |file| analyze_file(file) }
      end

      def analyze_file(file)
        dest = file.pathmap("%{^#{reveal_js_dir}/,#{output_dir}/}p")
        copy_file(file, dest)
        dest_dir = dest.pathmap('%d')
        create_directory(dest_dir)
        things_to_create.add(dest_dir)
        things_to_create.add(dest)
      end
    end
  end
end
