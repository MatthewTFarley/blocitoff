require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  
  setup do
    @list = lists(:one)
    @task = tasks(:one)
    sign_in @list.user
  end
  
    test "should create task" do
      assert_difference('Task.count') do
        post :create, task: { description: @task.description, list_id: @list }
      end
      
      assert_redirected_to list_path(assigns(:list))
    end

end
