require 'rake'
require 'rake/tasklib'
require 'reveal-ck'

module RevealCK
  # Generate a reveal.js presentation
  class RakeTask < Rake::TaskLib
    include ::Rake::DSL if defined?(::Rake::DSL)

    # Name of task.
    #
    # default:
    #   :reveal
    attr_accessor :name

    # File containing slide content.
    #
    # default:
    #   'slides.*'
    attr_accessor :file

    # Directory where slides are placed.
    #
    # default:
    #   'slides'
    attr_accessor :dir

    attr_accessor :user_dir
    attr_accessor :gem_dir
    attr_accessor :config

    def initialize(*args, &task_block)
      @name     = args.shift || :reveal
      @file     = FileList['slides.*'].first
      @dir      = 'slides'
      @user_dir = Dir.pwd
      @gem_dir  = RevealCK.path
      @config   = Config.new
      yield self if block_given?
      define(args, &task_block)
    end

    # @private
    def run_task(verbose)
      puts "Generating slides for '#{file}'.." if verbose

      slides_builder = RevealCK::Builders::SlidesBuilder.new(
        user_dir: user_dir,
        gem_dir: gem_dir,
        output_dir: dir,
        slides_file: file,
        config: config
      )
      slides_builder.prepare
      slides_builder.build
    end

    def define(args, &task_block)
      last_description = ::Rake.application.last_description
      desc 'Generate a reveal.js presentation' unless last_description
      task name, *args do |_, task_args|
        RakeFileUtils.__send__(:verbose, verbose) do
          yield(*[self, task_args].slice(0, task_block.arity)) if task_block
          run_task verbose
        end
      end
    end
  end
end
