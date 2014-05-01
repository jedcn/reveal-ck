require 'rake'

module RevealCK
  module Builders
    # Given a location of reveal.js files, reveal-ck files, and slides
    # file to work with, and a place to put it all.. this class
    # creates a presentation.
    class SlidesBuilder
      include Config
      include RequiredArg
      attr_reader :revealjs_dir, :revealck_dir
      attr_reader :slides_file, :output_dir
      attr_reader :application
      def initialize(args)
        @revealjs_dir = required_arg(args, :revealjs_dir)
        @revealck_dir = required_arg(args, :revealck_dir)
        @output_dir = required_arg(args, :output_dir)
        @slides_file = required_arg(args, :slides_file)
        @application = Rake::Application.new
      end

      def build
        config_file = File.join(@revealck_dir, 'config.yml')
        from_file(file: config_file) if File.exist?(config_file)

        CopyUserFiles.new(user_files_dir: revealck_dir,
                          output_dir: output_dir,
                          application: application)

        CopyRevealJs.new(revealjs_dir: revealjs_dir,
                         output_dir: output_dir,
                         application: application)

        CreateSlidesHtml.new(slides_file: slides_file,
                             config: self,
                             output_dir: output_dir,
                             application: application)

        CreateIndexHtml.new(slides_html: "#{output_dir}/slides.html",
                            output_dir: output_dir,
                            config: self,
                            application: application)

        dependencies = %w(copy_user_files
                          copy_reveal_js
                          create_slides_html
                          create_index_html)

        application.define_task(Rake::Task, 'create' => dependencies)
        application['create'].invoke
      end
    end
  end
end
