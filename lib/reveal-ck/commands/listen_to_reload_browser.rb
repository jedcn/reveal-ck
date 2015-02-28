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
        require 'guard/cli'
        Guard::UI.options[:template] = "#{prefix} :message"
        guardfile = RevealCK.path('files/reveal-ck/Guardfile')
        Thread.new do
          Guard.start(guardfile: guardfile)
        end
      end
    end
  end
end
