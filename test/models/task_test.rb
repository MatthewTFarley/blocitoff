require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  test "belongs to list" do
    user = User.create!(email: "user@example.com", password: '12345678')
    list = List.create!(name: "my list", user: user)
    task = Task.create!(description: "Do a thing", list: list)
    
    assert_equal(user, list.user)
   end
  
  test "has a list" do
    user = User.create!(email: "user@example.com", password: '12345678')
    task = Task.new(description: "Do a thing")
    refute task.save, "Task shouldn't have saved without a list"
    task.list = List.create!(name: "my list", user: user)
    assert task.save
  end
end
