require 'spec_helper'
require 'tmpdir'

module RevealCK
  module Builders
    class RakeAwareTestingClass
      include RakeAware
      attr_reader :application
      def initialize
        @application = Rake::Application.new
      end
    end

    describe RakeAware do

      describe 'when included into a class with a rake application' do

        let :example do
          RakeAwareTestingClass.new
        end

        describe '#task' do
          it 'provides a shortcut for defining a task' do
            signal = false
            example.task('example_task') do
              signal = true
            end
            example.application['example_task'].invoke
            expect(signal).to be true
          end
        end

        describe '#copy_file' do
          it 'provides a shortcut for copying files' do
            Dir.mktmpdir do |dir|
              Dir.chdir(dir) do
                File.open('source', 'w') { |file| file.write('source') }
                example.copy_file('source', 'destination')
                example.application['destination'].invoke
                expect(File.exist?('destination')).to be true
                content = File.open('destination', 'r').read
                expect(content).to eq 'source'
              end
            end
          end
        end

        describe '#create_directory' do
          it 'provides a shortcut for creating a directory' do
            Dir.mktmpdir do |dir|
              Dir.chdir(dir) do
                example.create_directory('example_directory')
                example.application['example_directory'].invoke
                expect(File.directory?('example_directory')).to be true
              end
            end
          end
        end
      end
    end
  end
end
