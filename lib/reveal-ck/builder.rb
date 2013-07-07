module RevealCK
  class Builder

    def register_tasks
      raise "Subclasses must implement register_tasks"
    end

    def add_task(description, action)
      @tasks << BuildTask.new({
                                description: description,
                                action: action
                              })
    end

    def build!
      register_tasks unless @tasks
      @tasks.each {|task| task.go!}
    end

  end
end
