require 'fileutils'

module RevealCK
  #
  # Public: A PresentationBuilder knows how to bundle together all of
  # the various files that makeup a reveal.js presentation
  #
  class PresentationBuilder < Builder

    attr_reader :image_files, :slides_file, :config
    attr_reader :tasks

    def initialize(args)
      @image_files = args[:image_files]
      @slides_file = args[:slides_file]
      @presentation = args[:presentation]
      missing_info = 'either :slides_file or :presentation is required'
      raise missing_info unless @slides_file || @presentation
      @output_dir = args[:output_dir]
      @config = args[:config]
    end

    def output_dir(child=nil)
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
      transform_slides @slides_file, @presentation, slides_html
      bundle_revealjs output_dir
      bundle_image_files image_files, output_dir('images')
      config = @presentation || @config
      create_index_html slides_html, output_dir('index.html'), config
    end

    def create_dir(dir)
      add_task "Ensuring #{dir}/ exists" do
        FileUtils.mkdir_p dir, verbose: false
      end
    end

    def transform_slides(slides_file, presentation, slides_html)
      if slides_file
        action = "Transforming #{slides_file} into '#{slides_html}'}"
        builder = SlidesHtmlBuilder.new input_file: slides_file
      else
        description = "Transforming Presentation into '#{slides_html}'}"
        builder = SlidesHtmlBuilder.new presentation: presentation
      end
      add_task description do
        builder.write_to file: slides_html
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
      add_task "Creating slides/index.html" do
        slide_builder =
          SlideBuilder.new({
                             user_slides: slides_html,
                             reveal_slides: index_html,
                             config: config
                           })
        slide_builder.build!
      end
    end
  end
end
