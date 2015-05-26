require 'rake'
require 'rake/tasklib'
require_relative '../reveal-ck'

module RevealCK
  # "generates a reveal presentation"
  class RakeTask < Rake::TaskLib
    # the file containing your slide content (defaults to slides.md)
    attr_accessor :file
    # the output directory (default slides)
    attr_accessor :dir
    attr_accessor :user_dir
    attr_accessor :gem_dir
    attr_accessor :stdout_prefix
    attr_accessor :config

    def initialize(name = :reveal)
      @name   = name
      @file = FileList['slides.*'].first
      @dir = 'slides'
      @user_dir = Dir.pwd
      @gem_dir = RevealCK.path
      @stdout_prefix = ''
      @config = Config.new
      yield self if block_given?
      define
    end

    def define
      desc "generate a reveal slideshow"
      task @name do
        msg = "Generating slides for '#{file}'.."
        msg = "#{stdout_prefix} #{msg}" unless stdout_prefix.empty?
        puts msg

        slides_builder = RevealCK::Builders::SlidesBuilder.new(
          user_dir: user_dir,
          gem_dir: gem_dir,
          output_dir: dir,
          slides_file: file,
          stdout_prefix: stdout_prefix,
          config: config,
        )
        slides_builder.prepare
        slides_builder.build
      end
    end
  end
end
