require 'listen'

module RevealCK
  module Commands
    # The idea of listening for file system changes and then
    # rebuilding slides.
    class ListenToRebuildSlides
      def initialize(options)
        # TODO: Should include css/*.css, and config.yml
        listen_regex = /^slides\..+$/
        @listener = ::Listen.to('.', only: listen_regex) do |m, a, r|
          puts "modified absolute path: #{m}"
          puts "added absolute path: #{a}"
          puts "removed absolute path: #{r}"
          RevealCK::Commands::Generate.new(options).run
        end
      end

      def run
        @listener.start
      end
    end
  end
end
