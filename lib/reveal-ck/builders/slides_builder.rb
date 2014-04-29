require 'rake'

module RevealCK
  module Builders
    class SlidesBuilder
      attr_reader :revealjs_dir, :revealck_dir
      attr_reader :slides_file, :output_dir
      attr_reader :application
      def initialize(args)
        @revealjs_dir = args[:revealjs_dir] || fail(':revealjs_dir is required')
        @revealck_dir = args[:revealck_dir] || fail(':revealck_dir is required')
        @output_dir   = args[:output_dir]   || fail(':output_dir is required')
        @slides_file  = args[:slides_file]  || fail(':slides_file is required')
        @application  = Rake::Application.new
      end

      def build
        CopyUserFiles.new(user_files_dir: revealck_dir,
                          output_dir: output_dir,
                          application: application)

        CopyRevealJs.new(revealjs_dir: revealjs_dir,
                         output_dir: output_dir,
                         application: application)

        CreateSlidesHtml.new(slides_file: slides_file,
                             output_dir: output_dir,
                             application: application)

        dependencies = ['copy_user_files',
                        'copy_reveal_js',
                        'create_slides_html']

        application.define_task(Rake::Task, 'create' => dependencies)
        application['create'].invoke

        # Given that you've got the slides_file translated into
        # slides_html, send the slides_html off to CreateIndexHtml so
        # that it can be built up
        templates_dir = 'templates' # The location of the templates
        # for building out the index.html-- head, body, init.js
        # create_index_html = CreateIndexHtml.new(slides_html: slides_html,
        #                                         templates_dir: templates_dir
        #                                         output_dir: output_dir
        #                                         application: application)
        # create_index_html.build
      end
    end
  end
end
