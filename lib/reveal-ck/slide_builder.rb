module RevealCK
  class SlideBuilder

    attr_reader :user_slides, :reveal_slides

    attr_reader :tasks

    def initialize(args)
      @user_slides = args[:user_slides]
      @reveal_slides = args[:reveal_slides]
      register_tasks
    end

    def build!
      tasks.each {|task| task.go!}
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
