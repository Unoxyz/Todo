require "./test/test_helper"
require "rack/test"
require "sinatra/base"
require "api"

class APITest < MiniTest::Test
  include Rack::Test::Methods
  include WithRollback

  def app
    TodoAPI
  end

  def test_hello_world
    temporarily do
      Todo.create(title: 'make todo app', :description => 'A wonderful idea!')
      get '/'
      expected = "[{\"id\":1,\"title\":\"make todo app\",\"description\":\"A wonderful idea!\"}]"
      assert_equal expected, last_response.body
    end
  end
end
