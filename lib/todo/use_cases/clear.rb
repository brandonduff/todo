module Todo
  module UseCases
    class Clear
      def perform
        task_list = TaskListFetcher.new(reader).tasks_for_day(read_current_day)
        task_list.clear
        write(task_list)
      end

      private

      def read_current_day
        reader.current_day
      end

      def write(task_list)
        Writer.for(task_list).write_to(env_helper.todo_file_for_day(reader.current_day))
      end

      def reader
        Reader.new(env_helper)
      end

      def env_helper
        EnvHelper.new
      end
    end
  end
end