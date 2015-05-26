require 'rake'
require 'rake/tasklib'
require 'reveal-ck'

module RevealCK
  # "generates a reveal presentation"
  class RakeTask < Rake::TaskLib
    include ::Rake::DSL if defined?(::Rake::DSL)

    # Name of task.
    # Defauts to `:reveal`.
    attr_accessor :name

    # the file containing your slide content.
    # Defaults to `'slides.md'`.
    attr_accessor :file

    # the output directory
    # Defaults to `'slides'`.
    attr_accessor :dir
    attr_accessor :user_dir
    attr_accessor :gem_dir
    attr_accessor :config

    def initialize(*args, &task_block)
      @name          = args.shift || :reveal
      @file          = FileList['slides.*'].first
      @dir           = 'slides'
      @user_dir      = Dir.pwd
      @gem_dir       = RevealCK.path
      @config        = Config.new
      yield self if block_given?
      define(args, &task_block)
    end

    # @private
    def run_task(verbose)
      puts "Generating slides for '#{file}'.." if verbose

      slides_builder = RevealCK::Builders::SlidesBuilder.new(
        user_dir:      user_dir,
        gem_dir:       gem_dir,
        output_dir:    dir,
        slides_file:   file,
        config:        config
      )
      slides_builder.prepare
      slides_builder.build
    end

    def define(args, &task_block)
      desc 'Generate a reveal slideshow' unless ::Rake.application.last_comment
      task name, *args do |_, task_args|
        RakeFileUtils.__send__(:verbose, verbose) do
          if task_block
            task_block.call(*[self, task_args].slice(0, task_block.arity))
          end
          run_task verbose
        end
      end
    end
  end
end
