require 'spec_helper'

module RevealCK
  module Commands
    describe ThreadWaker do
      describe '#run' do
        it 'wakes up an associated thread periodically' do
          signal = false
          signal_changer = Thread.new do
            # This sleep will be infinite unless someone wakes it up..
            sleep
            signal = true
          end
          ThreadWaker.new(signal_changer, 0.1).run
          sleep 0.2
          expect(signal).to eq true
        end
      end
    end
  end
end
