require 'spec_helper'

module RevealCK
  module Builders
    describe CreationTask do
      describe 'a subclass with an incomplete implementation' do
        it 'fails unless subclasses implement setup' do
          expect { CreationTask.new(application: double) }
            .to raise_error(RuntimeError,
                            'setup must be implemented by subclasses')
        end
      end

      describe 'a subclass with a complete implementation' do

        before(:all) do
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
        end

        it 'invokes setup at initialization time' do
          application = double
          expect(application).to receive(:define_task)
          example = CreationTaskTestingClass.new(application: application)
          expect(example.setup_called).to be true
        end

        it 'responds to name by underscoring the Class' do
          args_expected_to_be_passed_to_rake = {
            'creation_task_testing_class' => %w(foo bar)
          }
          application = double
          expect(application)
            .to receive(:define_task).with(Rake::Task,
                                           args_expected_to_be_passed_to_rake)
          example = CreationTaskTestingClass.new(application: application)
          expect(example.name).to eq 'creation_task_testing_class'
        end

        it 'defines a task on the application at initialization time' do
          args_expected_to_be_passed_to_rake = {
            'creation_task_testing_class' => %w(foo bar)
          }
          application = double
          expect(application)
            .to receive(:define_task).with(Rake::Task,
                                           args_expected_to_be_passed_to_rake)
          CreationTaskTestingClass.new(application: application)
        end
      end
    end
  end
end
