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

      add_task "Ensuring #{output_dir}/ exists",
               lambda {
                 FileUtils.mkdir_p output_dir, verbose: false
               }

      slides_html = output_dir 'slides.html'
      if @slides_file
        action = "Transforming #{slides_file} into '#{slides_html}'}"
        builder = SlidesHtmlBuilder.new input_file: @slides_file
      else
        action = "Transforming Presentation into '#{slides_html}'}"
        builder = SlidesHtmlBuilder.new presentation: @presentation
      end

      add_task(action,
               lambda {
                 builder.write_to file: slides_html
               })

      add_task "Bundling up the revealjs stuff into #{output_dir}/",
               lambda {
                   FileUtils.cp_r RevealCK::REVEALJS_FILES,
                                output_dir,
                                  verbose: false
               }

      if image_files
        add_task "Copying in images into #{output_dir('images')}",
                 lambda {
                   FileUtils.mkdir_p output_dir('images'), verbose: false
                   FileUtils.cp_r image_files,
                                  output_dir('images'),
                                  verbose: false
                 }
      end

      add_task "Creating slides/index.html",
               lambda {
                 slide_builder =
                   SlideBuilder.new({
                                      user_slides: slides_html,
                                      reveal_slides: output_dir('index.html'),
                                      config: @presentation || config
                                    })
                 slide_builder.build!
               }

    end

  end
end
