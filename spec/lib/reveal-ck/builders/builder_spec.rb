require 'spec_helper'

module RevealCK
  module Builders

    describe Builder, 'when subclassed' do

      it 'requires that subclasses implement #register_tasks' do
        class BadBuilder < Builder; end
        bad_builder = BadBuilder.new
        expect { bad_builder.register_tasks }.to raise_error
      end

      it 'invokes each registered task when it receives #build' do

        class TestBuilder < Builder

          attr_reader :value

          def initialize
            @value = 0
          end

          def register_tasks
            @tasks = []
            @value = 0
            add_task 'Set Value to 1' do
              @value = 1
            end
          end
        end

        test_builder = TestBuilder.new
        test_builder.build!
        expect(test_builder.value).to eq 1
      end
    end
  end
end
