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
        require 'guard'
        guardfile = RevealCK.path('files/reveal-ck/Guardfile')
        Guard::UI.options[:template] = "#{prefix} :message"
        Guard.start guardfile: guardfile, no_interactions: true
      end
    end
  end
end
