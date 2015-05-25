require 'rake'
require 'yaml'

module RevealCK
  module Builders
    # Given a location of reveal.js files, reveal-ck files, and slides
    # file to work with, and a place to put it all.. this class
    # creates a presentation.
    class SlidesBuilder < CreationTask
      attr_reader :user_dir, :gem_dir, :reveal_js_dir
      attr_reader :slides_file, :output_dir
      attr_reader :application
      def initialize(args)
        @user_dir = retrieve(:user_dir, args)
        @gem_dir = retrieve(:gem_dir, args)
        @reveal_js_dir = File.join(gem_dir, 'files', 'reveal.js')
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
        load_init
        read_config
        things_to_create.merge(dependencies)
      end

      def read_config
        config_file = File.join(user_dir, 'config.yml')
        return unless File.exist?(config_file)
        config_as_hash = YAML.load_file config_file
        @config.merge!(config_as_hash)
      end

      def load_init
        init_file = File.join(user_dir, 'init.rb')
        return unless File.exist?(init_file)
        require init_file
      end

      def dependencies
        [copy_user_files,
         copy_reveal_ck_files,
         copy_reveal_js_files,
         create_slides_html,
         create_index_html]
      end

      def copy_files(file_listing)
        task = CopyFilesTask.new(file_listing: file_listing,
                                 output_dir: output_dir,
                                 application: application)
        task.prepare
      end

      def copy_user_files
        user_files = UserFiles.new(dir: user_dir)
        copy_files(user_files)
      end

      def copy_reveal_ck_files
        reveal_ck_files_dir = File.join(gem_dir, 'files', 'reveal-ck')
        reveal_ck_files = RevealCkFiles.new(dir: reveal_ck_files_dir)
        copy_files(reveal_ck_files)
      end

      def copy_reveal_js_files
        reveal_js_files = RevealJsFiles.new(dir: reveal_js_dir)
        copy_files(reveal_js_files)
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
                              template: index_html_erb,
                              output_dir: output_dir,
                              config: @config,
                              application: application)
        task.prepare
      end
    end
  end
end
