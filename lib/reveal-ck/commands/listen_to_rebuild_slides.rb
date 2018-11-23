require 'listen'

module RevealCK
  module Commands
    # The idea of listening for file system changes and then
    # rebuilding slides.
    class ListenToRebuildSlides
      attr_reader :ui, :rebuild_method
      def initialize(ui, &block)
        @ui = ui
        @rebuild_method = block
      end

      def run
        ::Listen.to('.', ignore: ignored_files_regex) do |mod, add, del|
          message_and_rebuild(mod, add, del)
        end.start
      end

      private

      def message_about_files(files, message)
        return if files.empty?

        file_names = files.join(', ')
        ui.message("#{message}: #{file_names}", :rebuild)
      end

      def ignored_files_regex
        %r{^slides/.+$}
      end

      def message_and_rebuild(mod, add, del)
        message_about_files(mod, 'Modified')
        message_about_files(add, 'Added')
        message_about_files(del, 'Deleted')
        rebuild_method.call
      end
    end
  end
end
