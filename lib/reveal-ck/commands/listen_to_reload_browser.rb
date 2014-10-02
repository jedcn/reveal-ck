module RevealCK
  module Commands
    # The idea of listening for file system changes that indicate its
    # time to tell browsers to reload.
    class ListenToReloadBrowser
      require 'guard'
      def run
        guardfile = RevealCK.path('files/reveal-ck/Guardfile')
        Guard.start guardfile: guardfile
      end
    end
  end
end
