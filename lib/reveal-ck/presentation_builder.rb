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

      add_task "Transforming #{slides_file} into #{output_dir('slides_html')}'}",
               lambda {
                 processor = TemplateProcessor.open slides_file
                 File.open(output_dir('slides.html'), 'w') { |f| f << processor.output }
               }

      add_task "Bundling up the revealjs stuff into #{output_dir}/",
               lambda {
                 FileUtils.cp_r RevealCK::REVEALJS_FILES, output_dir, verbose: false
               }

      add_task "Copying in images into #{output_dir('images')}",
               lambda {
                 FileUtils.mkdir_p output_dir('images'), verbose: false
                 FileUtils.cp_r image_files, output_dir('images'), verbose: false
               }

      add_task "Creating slides/index.html",
               lambda {
                 slide_builder = SlideBuilder.new({
                                                    user_slides: output_dir('slides.html'),
                                                    reveal_slides: output_dir('index.html'),
                                                    config: config
                                                  })
                 slide_builder.build!
               }

    end

  end
end
