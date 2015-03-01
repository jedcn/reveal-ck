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
        ThreadWaker.new(sleeping_guard).run
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
    end
  end
end
