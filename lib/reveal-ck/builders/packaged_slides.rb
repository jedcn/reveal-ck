require 'fileutils'

module RevealCK
  module Builders
    #
    # Public: A PackagedSlides knows how to bundle together all of the
    # various files that makeup a reveal.js presentation.
    #
    class PackagedSlides < Builder

      attr_reader :image_files, :tasks

      def initialize(args)
        @presentation =
          args[:presentation] || raise(':presentation is required')
        @image_files = args[:image_files]
        @output_dir = args[:output_dir]
      end

      def output_dir(child = nil)
        if child
          File.join(@output_dir, child)
        else
          @output_dir
        end
      end

      private

      def register_tasks
        @tasks = []
        slides_html = output_dir 'slides.html'
        create_dir output_dir
        write_slides_html @presentation, slides_html
        bundle_revealjs output_dir
        bundle_image_files image_files, output_dir('images')
        create_index_html slides_html, output_dir('index.html'), @presentation
      end

      def create_dir(dir)
        add_task "Ensuring #{dir}/ exists" do
          FileUtils.mkdir_p dir, verbose: false
        end
      end

      def write_slides_html(presentation, slides_html)
        add_task "Writing Presentation to '#{slides_html}'" do
          File.open(slides_html, 'w') { |file| file << presentation.html }
        end
      end

      def bundle_revealjs(output_dir)
        add_task "Bundling up the revealjs stuff into #{output_dir}/" do
          FileUtils.cp_r(RevealCK::REVEALJS_FILES,
                         output_dir,
                         verbose: false)
        end
      end

      def bundle_image_files(image_files, image_output_dir)
        if image_files
          add_task "Copying in images into '#{image_output_dir}'" do
            FileUtils.mkdir_p(image_output_dir, verbose: false)
            FileUtils.cp_r(image_files,
                           image_output_dir,
                           verbose: false)
          end
        end
      end

      def create_index_html(slides_html, index_html, config)
        add_task 'Creating slides/index.html' do
          slide_builder =
            IndexHtml.new({
                            user_slides: slides_html,
                            reveal_slides: index_html,
                            config: config
                          })
          slide_builder.build!
        end
      end
    end
  end
end
