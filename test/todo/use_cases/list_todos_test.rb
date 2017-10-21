require 'test_helper'
require 'fileutils'

module Todo
  module UseCases
    class ListTodosTest < Minitest::Test

      def setup
        @original_home = ENV['HOME']
        ENV['HOME'] = 'tmp'
        current_day = Date.parse('10-03-1993')
        current_day_file_name = 'tmp/.current_day.txt'
        Dir.mkdir('tmp') unless Dir.exist?('tmp')
        current_day = File.open(current_day_file_name, 'a')
        current_day.puts('10-03-1993')
        current_day.close
        Dir.mkdir('tmp/todos') unless Dir.exist?('tmp/todos')
      end

      def teardown
        ENV['HOME'] = @original_home
        FileUtils.rm_rf('tmp')
      end

      def test_list_with_no_current_todos_returns_empty_list
        todos = ListTodos.new({}).perform

        assert_equal([], todos)
      end

      def test_list_returns_todos_as_array
        todo_file_name = 'tmp/todos/10-03-1993.txt'
        todo_file = File.open(todo_file_name, 'w+')
        todo_file.puts('hello')
        todo_file.puts('goodbye')
        todo_file.close

        todos = ListTodos.new({}).perform

        assert_equal(%w(hello goodbye), todos)
      end
    end
  end
end
