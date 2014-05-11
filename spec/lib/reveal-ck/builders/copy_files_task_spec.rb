require 'spec_helper'

module RevealCK
  module Builders
    describe CopyFilesTask do
      let :source_dir do
        'source'
      end

      let :file_a_source do
        "#{source_dir}/file_a"
      end

      let :file_b_source do
        "#{source_dir}/file_b"
      end

      let :file_listing do
        file_listing = double

        file_listing
          .stub(:files)
          .and_return([file_a_source, file_b_source])

        file_listing
          .stub(:dir)
          .and_return(source_dir)

        file_listing
      end

      let :directory_to_be_created do
        'destination'
      end

      let :file_a_to_be_created do
        "#{directory_to_be_created}/file_a"
      end

      let :file_b_to_be_created do
        "#{directory_to_be_created}/file_b"
      end

      it 'sets up application tasks to copy files' do
        application = double

        # Expect a task to be defined that will cause the output_dir
        # to be created
        expect(application)
          .to receive(:define_task)
          .with(Rake::Task, directory_to_be_created).at_least(:once)

        # Expect tasks to be defined that will cause the destination
        # files to be created
        expect(application)
          .to receive(:define_task)
          .with(Rake::FileTask,
                file_a_to_be_created => file_a_source)

        expect(application)
          .to receive(:define_task)
          .with(Rake::FileTask,
                file_b_to_be_created => file_b_source)

        # Expect a call that creates a task that matches the name of
        # the class and all dependencies that should be created
        name_of_class = 'copy_files_task'
        tasks_to_be_executed = [directory_to_be_created,
                                file_a_to_be_created,
                                file_b_to_be_created]

        expect(application)
          .to receive(:define_task)
          .with(Rake::Task,
                name_of_class => tasks_to_be_executed)

        task = CopyFilesTask.new(application: application,
                                 file_listing: file_listing,
                                 output_dir: directory_to_be_created)
        task.prepare
      end
    end
  end
end
