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
  
  test "checks number of days remaining" do
    user = User.create!(email: "user@example.com", password: '12345678')
    list = List.create!(name: "my list", user: user)
    task = Task.create!(description: "Do a thing", created_at: 3.days.ago, list: list)
    assert_equal(4, task.days_left)
  end 
  
  test "days left should be 0 when task was created more than 7 days ago" do
    user = User.create!(email: "user@example.com", password: '12345678')
    list = List.create!(name: "my list", user: user)
    task = Task.create!(description: "Do a thing", created_at: 10.days.ago, list: list)
    
    assert_equal(0, task.days_left)
  end
end
