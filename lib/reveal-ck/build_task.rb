module RevealCK
  class BuildTask

    def initialize(args)
      @builder = args[:builder]
      @description = args[:description]
      @action = args[:action]
    end

    def go!
      @action.call
    end
  end

end
