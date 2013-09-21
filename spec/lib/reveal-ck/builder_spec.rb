require 'spec_helper'

module RevealCK

  describe Builder, 'when subclassed' do

    it 'requires that subclasses implement #register_tasks' do
      class BadBuilder < Builder; end
      bad_builder = BadBuilder.new
      expect { bad_builder.register_tasks }.to raise_error
    end

    it 'invokes each registered task when it receives #build' do

      class TestBuilder < Builder
        attr_reader :action_mock
        def register_tasks
          @tasks = []
          add_task('Some Task Description',
                   lambda {
                     @action_mock.do_something
                   })
        end
      end

      test_builder = TestBuilder.new
      expect(test_builder.action_mock).to receive :do_something
      test_builder.build!
    end
  end
end
