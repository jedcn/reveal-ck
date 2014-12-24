require 'spec_helper'

module RevealCK
  module Builders
    class CreationTaskTestingClass < CreationTask
      attr_reader :setup_called
      def initialize(args)
        @setup_called = false
        super
      end

      def setup
        @setup_called = true
        things_to_create << 'foo'
        things_to_create << 'bar'
      end
    end

    describe CreationTask do
      describe '#name' do
        it 'underscores the name of the Class' do
          application = double
          example = CreationTaskTestingClass.new(application: application)
          expect(example.name).to eq 'creation_task_testing_class'
        end
      end

      describe 'a subclass with an incomplete implementation' do
        it 'fails "prepare" unless subclasses implement "setup"' do
          expect do
            creation_task = CreationTask.new(application: double)
            creation_task.prepare
          end.to raise_error(RuntimeError,
                             'setup must be implemented by subclasses')
        end
      end

      describe 'a subclass with a complete implementation' do
        describe '#prepare' do
          it 'invokes setup' do
            application = double
            expect(application).to receive(:define_task)
            example = CreationTaskTestingClass.new(application: application)
            example.prepare
            expect(example.setup_called).to be true
          end

          it 'returns the value of name' do
            application = double
            expect(application).to receive(:define_task)
            example = CreationTaskTestingClass.new(application: application)
            result = example.prepare
            expect(result).to eq example.name
          end

          it 'defines a task on the application' do
            args_expected_to_be_passed_to_rake = {
              'creation_task_testing_class' => %w(foo bar)
            }
            application = double
            expect(application)
              .to(receive(:define_task)
                    .with(Rake::Task,
                          args_expected_to_be_passed_to_rake))
            task = CreationTaskTestingClass.new(application: application)
            task.prepare
          end
        end
      end
    end
  end
end
