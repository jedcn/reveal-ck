module RevealCK
  module Commands
    # Utility that wakes up a thread periodically
    class ThreadWaker
      def initialize(thread_to_wake, wait_period = 1)
        @thread_to_wake, @wait_period = thread_to_wake, wait_period
      end

      def run
        Thread.new do
          loop do
            sleep @wait_period
            @thread_to_wake.wakeup
          end
        end
      end
    end
  end
end
