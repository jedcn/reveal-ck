require 'listen'

module RevealCK
  module Commands
    # The idea of listening for file system changes and then
    # rebuilding slides.
    class ListenToRebuildSlides
      attr_reader :ui, :rebuild_method
      def initialize(ui, slides_file, &block)
        @ui = ui
        @slides_file = slides_file
        @rebuild_method = block
      end

      def run
        ::Listen.to('.', only: slides_file_regex) do |mod, add, del|
          message_and_rebuild(mod, add, del)
        end.start
      end

      private

      def message_about_files(files, message)
        return if files.empty?

        file_names = files.join(', ')
        ui.message("#{message}: #{file_names}", :rebuild)
      end

      def slides_file_regex
        /^#{@slides_file}$/
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
