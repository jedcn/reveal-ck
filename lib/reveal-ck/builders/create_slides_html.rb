require 'html/pipeline'

module RevealCK
  module Builders
    # Given a slides_file, a Rake application, and a place where the
    # transformed slides file should end up, this class knows how to
    # work with Rake and create the slides.html.
    class CreateSlidesHtml < CreationTask
      attr_reader :slides_file, :output_dir, :config

      def initialize(args)
        @slides_file = retrieve(:slides_file, args)
        @output_dir = retrieve(:output_dir, args)
        @config = retrieve(:config, args)
        super
      end

      def setup
        slides_html_file = "#{output_dir}/slides.html"
        task(slides_html_file) do
          File.open(slides_html_file, 'w') do |slides_html|
            slides_html.puts(presentation_html)
          end
        end
        things_to_create.add(slides_html_file)
      end

      private

      def presentation_html
        presentation = RevealCK::Presentation.load(file: slides_file,
                                                   config: config)
        initial_html = presentation.html
        apply_filters_to(initial_html)
      end

      def apply_filters_to(html)
        pipeline = HTML::Pipeline.new([HTML::Pipeline::RevealCKEmojiFilter])
        filtered_html_string = FilteredHtmlString.new(html: html,
                                                      config: config.to_h,
                                                      pipeline: pipeline)
        filtered_html_string.render
      end
    end
  end
end


module HTML
  class Pipeline
    class RevealCKEmojiFilter < EmojiFilter
      def emoji_image_filter(text)
        return text unless text.include?(':')

        text.gsub EmojiPattern do |match|
          name = $1
          "<img class='emoji' title=':#{name}:' alt=':#{name}:' src='#{emoji_url(name)}' align='absmiddle' />"
        end
      end
    end
  end
end
