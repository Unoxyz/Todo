require "./test/test_helper"

class TodoTest < MiniTest::Test
  include WithRollback

  def test_it_exists
    assert_equal 0, Todo.count # guard clause
    temporarily do
      Todo.create(title: 'make todo app', :description => 'A wonderful idea!')
      assert_equal 1, Todo.count
    end
    assert_equal 0, Todo.count
  end
end
