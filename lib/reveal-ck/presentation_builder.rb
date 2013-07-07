require 'fileutils'

module RevealCK
  class PresentationBuilder

    attr_reader :revealjs_files, :image_files, :output_dir, :slides_haml

    def initialize(args)
      @revealjs_files = args[:revealjs_files]
      @image_files = args[:image_files]
      @output_dir = args[:output_dir]
      @slides_haml = args[:slides_haml]
    end

    def build!
      # Create slides/
      FileUtils.mkdir_p output_dir, verbose: false

      # Create slides/slides.html
      processor = RevealCK::HamlProcessor.open slides_haml
      File.open(File.join(output_dir, 'slides.html'), 'w') { |f| f << processor.html }

      # Bundle up the revealjs stuff into slides/
      FileUtils.cp_r revealjs_files, output_dir, verbose: false

      # Copy in the user images into slides/images
      FileUtils.mkdir_p 'slides/images', verbose: false
      FileUtils.cp_r image_files, File.join(output_dir, 'images'), verbose: false

      # Finally, build up slides/index.html
      slide_builder = RevealCK::SlideBuilder.new({
                                                   user_slides: File.join(output_dir, 'slides.html'),
                                                   reveal_slides: File.join(output_dir, 'index.html')
                                                 })
      slide_builder.build!
    end

  end
end
