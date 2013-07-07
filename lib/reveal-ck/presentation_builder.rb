require 'fileutils'

module RevealCK
  class PresentationBuilder

    attr_reader :revealjs_files, :image_files, :slides_haml
    attr_reader :tasks

    def initialize(args)
      @revealjs_files, @image_files = args[:revealjs_files], args[:image_files]
      @slides_haml = args[:slides_haml]
      @output_dir = args[:output_dir]
      register_tasks
    end

    def build!
      tasks.each {|task| task.go!}
    end

    def output_dir(child=nil)
      if child
        File.join(@output_dir, child)
      else
        @output_dir
      end
    end

    private

    def add_task(description, action)
      @tasks << BuildTask.new({
                                builder: self,
                                description: description,
                                action: action
                              })
    end

    def register_tasks

      @tasks = []

      add_task "Ensuring #{output_dir}/ exists",
               lambda {
                 FileUtils.mkdir_p output_dir, verbose: false
               }

      add_task "Transforming #{slides_haml} into #{output_dir('slides_html')}'}",
               lambda {
                 processor = HamlProcessor.open slides_haml
                 File.open(output_dir('slides.html'), 'w') { |f| f << processor.html }
               }

      add_task "Bundling up the revealjs stuff into #{output_dir}/",
               lambda {
                 FileUtils.cp_r revealjs_files, output_dir, verbose: false
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
                                                    reveal_slides: output_dir('index.html')
                                                  })
                 slide_builder.build!
               }

    end

  end
end
