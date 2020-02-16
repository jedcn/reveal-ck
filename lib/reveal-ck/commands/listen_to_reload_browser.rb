module RevealCK
  module Commands
    # The idea of listening for file system changes that indicate its
    # time to tell browsers to reload.
    class ListenToReloadBrowser
      attr_reader :prefix

      def initialize(ui, output_dir)
        @prefix = ui.prefix_for(:reload)
        @output_dir = output_dir
      end

      def run
        sleeping_guard = setup_and_run_guard
        ThreadWaker.new(sleeping_guard).run
        sleeping_guard
      end

      private

      def guardfile_contents
        guardfile_erb =
          RevealCK.template_path('reload_Guardfile',
                                 'Guardfile.erb')
        template = Tilt.new(guardfile_erb)
        locals = {
          output_dir: @output_dir
        }
        template.render(self, locals)
      end

      def setup_and_run_guard
        require 'guard/cli'
        Guard::UI.options = Guard::UI.options.merge(
          template: "#{prefix} :message"
        )
        contents = guardfile_contents
        Thread.new do
          Guard.start(guardfile_contents: contents, no_interactions: true)
        end
      end
    end
  end
end
