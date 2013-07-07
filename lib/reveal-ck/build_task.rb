module RevealCK
  class BuildTask

    def initialize(args)
      @description = args[:description]
      @action = args[:action]
    end

    def go!
      @action.call
    end
  end

end
