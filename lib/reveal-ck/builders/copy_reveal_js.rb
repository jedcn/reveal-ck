require 'rake'

module RevealCK
  module Builders
    # Given a copy of reveal.js, a Rake application, and a place where
    # everything should end up, this class knows how to work with Rake and
    # build up a presentation with the needed reveal.js stuff.
    class CopyRevealJs
      include RequiredArg
      attr_reader :revealjs_dir, :output_dir
      attr_reader :application
      attr_reader :things_to_create

      def initialize(args)
        @revealjs_dir = retrieve(:revealjs_dir, args)
        @output_dir = retrieve(:output_dir, args)
        @application = retrieve(:application, args)
        @things_to_create = Set.new
        analyze
      end

      private

      def analyze
        files = RevealJsFiles.new(revealjs_dir: revealjs_dir)
        files.all.each do |file|
          analyze_file(file)
        end
        application.define_task(Rake::Task,
                                'copy_reveal_js' => things_to_create.to_a)
      end

      def analyze_file(file)
        dest = file.pathmap("%{^#{revealjs_dir}/,#{output_dir}/}p")
        application.define_task(Rake::FileTask, dest => file) do
          FileUtils.cp file, dest
        end
        dest_dir = dest.pathmap('%d')
        application.define_task(Rake::Task, dest_dir) do
          FileUtils.mkdir_p dest_dir
        end
        things_to_create.add(dest_dir)
        things_to_create.add(dest)
      end
    end
  end
end
