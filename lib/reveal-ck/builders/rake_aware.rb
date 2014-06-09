require 'rake'

module RevealCK
  module Builders
    # Classes including this module reference a Rake application, and
    # know how to add tasks to it. They also know how to use it to
    # copy files and create directories.
    module RakeAware
      def task(*args, &block)
        application.define_task(Rake::Task, *args, &block)
      end

      def copy_file(source, destination)
        application.define_task(Rake::FileTask, destination => source) do
          FileUtils.cp source, destination
        end
      end

      def create_directory(dir)
        application.define_task(Rake::Task, dir) do
          FileUtils.mkdir_p dir
        end
      end
    end
  end
end
