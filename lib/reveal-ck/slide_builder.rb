module RevealCK
  #
  # Public: A SlideBuilder knows how to build the index.html file (the
  # core slides) within a reveal.js presentation.
  #
  class SlideBuilder < Builder

    attr_reader :user_slides, :reveal_slides

    attr_reader :tasks

    def initialize(args)
      @user_slides = args[:user_slides]
      @reveal_slides = args[:reveal_slides]
    end

    private

    def register_tasks

      @tasks = []

      add_task "Slicing out reveal.js default slides",
               lambda {
                 line_nums = {
                   default_slides: {
                     first: 37,
                     last: 338
                   }
                 }
                 default_slides = line_nums[:default_slides][:first]..line_nums[:default_slides][:last]
                 FileSlicer.remove! reveal_slides, default_slides
               }

      add_task "Splicing in slides from #{user_slides}",
               lambda {
                 FileSplicer.insert! user_slides, into: reveal_slides, after: '<div class="slides">'
               }
    end

  end
end
