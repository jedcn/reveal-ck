module RevealCK
  module Commands
    # The idea of listening for file system changes that indicate its
    # time to tell browsers to reload.
    class ListenToReloadBrowser
      attr_reader :prefix

      def initialize(ui)
        @prefix = ui.prefix_for(:reload)
      end

      def run
        sleeping_guard = setup_and_run_guard
        regularly_wakeup sleeping_guard
        sleeping_guard
      end

      private

      def setup_and_run_guard
        require 'guard/cli'
        Guard::UI.options[:template] = "#{prefix} :message"
        guardfile = RevealCK.path('files/reveal-ck/Guardfile')
        Thread.new do
          Guard.start(guardfile: guardfile, no_interactions: true)
        end
      end

      def regularly_wakeup(thread)
        Thread.new do
          loop do
            sleep 1
            thread.wakeup
          end
        end
      end
    end
  end
end
