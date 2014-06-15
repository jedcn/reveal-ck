require 'rake'
require 'yaml'

module RevealCK
  module Builders
    # Given a location of reveal.js files, reveal-ck files, and slides
    # file to work with, and a place to put it all.. this class
    # creates a presentation.
    class SlidesBuilder < CreationTask
      attr_reader :reveal_js_dir, :reveal_ck_dir
      attr_reader :slides_file, :output_dir
      attr_reader :application
      def initialize(args)
        @reveal_js_dir = retrieve(:reveal_js_dir, args)
        @reveal_ck_dir = retrieve(:reveal_ck_dir, args)
        @output_dir = retrieve(:output_dir, args)
        @slides_file = retrieve(:slides_file, args)
        @application = Rake::Application.new
        @config = Config.new
        @things_to_create = Set.new
      end

      def build
        application['slides_builder'].invoke
      end

      private

      def setup
        read_config
        things_to_create.merge(dependencies)
      end

      def read_config
        config_file = File.join(reveal_ck_dir, 'config.yml')
        return unless File.exist?(config_file)
        config_as_hash = YAML.load_file config_file
        @config.merge!(config_as_hash)
      end

      def dependencies
        [copy_user_files,
         copy_reveal_js,
         create_slides_html,
         create_index_html]
      end

      def copy_user_files
        file_listing = UserFiles.new(dir: reveal_ck_dir)
        task = CopyFilesTask.new(file_listing: file_listing,
                                 output_dir: output_dir,
                                 application: application)
        task.prepare
      end

      def copy_reveal_js
        file_listing = RevealJsFiles.new(dir: reveal_js_dir)
        task = CopyFilesTask.new(file_listing: file_listing,
                                 output_dir: output_dir,
                                 application: application)
        task.prepare
      end

      def create_slides_html
        task =
          CreateSlidesHtml.new(slides_file: slides_file,
                               config: @config,
                               output_dir: output_dir,
                               application: application)
        task.prepare
      end

      def create_index_html
        index_html_erb =
          RevealCK.template_path('index.html',
                                 'index.html.erb')
        task =
          CreateIndexHtml.new(slides_html: "#{output_dir}/slides.html",
                              index_html: index_html_erb,
                              output_dir: output_dir,
                              config: @config,
                              application: application)
        task.prepare
      end
    end
  end
end
