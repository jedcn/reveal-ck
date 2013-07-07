module RevealCK
  class SlideBuilder

    attr_reader :user_slides, :reveal_slides

    def initialize(args)
      @user_slides = args[:user_slides]
      @reveal_slides = args[:reveal_slides]
    end

    def build!

      line_nums = {
        default_slides: {
          first: 37,
          last: 338
        }
      }

      default_slides = line_nums[:default_slides][:first]..line_nums[:default_slides][:last]
      RevealCK::FileSlicer.remove! reveal_slides, default_slides
      RevealCK::FileSplicer.insert! user_slides, into: reveal_slides, after: '<div class="slides">'

    end

  end
end
