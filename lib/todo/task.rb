module Todo
  class Task

    def initialize(description, done = false)
      @description = description
      @done = done
    end

    def description
      done? ? '✓ ' + @description : @description
    end

    def done
      Task.new(@description, true)
    end

    def undo
      Task.new(@description, false)
    end

    def in_progress?
      !done?
    end

    def done?
      @done
    end

    def ==(other_task)
      other_task.description == description && other_task.done? == done?
    end
  end
end
