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
      raise 'either :slides_file or :presentation is required' unless @slides_file || @presentation
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

      if @slides_file
        add_task "Transforming #{slides_file} into #{output_dir('slides.html')}'}",
                 lambda {
                   builder = SlidesHtmlBuilder.new input_file: @slides_file
                   builder.write_to file: output_dir('slides.html')
                 }
      else
        add_task "Transforming Presentation into #{output_dir('slides.html')}'}",
                 lambda {
                   builder = SlidesHtmlBuilder.new presentation: @presentation
                   builder.write_to file: output_dir('slides.html')
                 }
      end

      add_task "Bundling up the revealjs stuff into #{output_dir}/",
               lambda {
                 FileUtils.cp_r RevealCK::REVEALJS_FILES, output_dir, verbose: false
               }

      if image_files
        add_task "Copying in images into #{output_dir('images')}",
                 lambda {
                   FileUtils.mkdir_p output_dir('images'), verbose: false
                   FileUtils.cp_r image_files, output_dir('images'), verbose: false
                 }
      end

      add_task "Creating slides/index.html",
               lambda {
                 slide_builder = SlideBuilder.new({
                                                    user_slides: output_dir('slides.html'),
                                                    reveal_slides: output_dir('index.html'),
                                                    config: @presentation || config
                                                  })
                 slide_builder.build!
               }

    end

  end
end
