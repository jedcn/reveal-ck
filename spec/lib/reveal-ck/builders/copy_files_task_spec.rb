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

        allow(file_listing)
          .to receive(:files)
          .and_return([file_a_source, file_b_source])

        allow(file_listing)
          .to receive(:dir)
          .and_return(source_dir)

        file_listing
      end

      let :destination_directory do
        'destination'
      end

      let :file_a_destination do
        "#{destination_directory}/file_a"
      end

      let :file_b_destination do
        "#{destination_directory}/file_b"
      end

      it 'creates the directory from the file_listing' do

        task = CopyFilesTask.new(application: Rake::Application.new,
                                 file_listing: file_listing,
                                 output_dir: destination_directory)
        expect(task)
          .to receive(:create_directory)
          .with(destination_directory)
          .at_least(:once)

        task.prepare
      end

      it 'creates the files from the file_listing' do
        task = CopyFilesTask.new(application: Rake::Application.new,
                                 file_listing: file_listing,
                                 output_dir: destination_directory)

        expect(task)
          .to receive(:copy_file)
          .with(file_a_source, file_a_destination)

        expect(task)
          .to receive(:copy_file)
          .with(file_b_source, file_b_destination)

        task.prepare
      end
    end
  end
end
