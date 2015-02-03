require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "belongs to user" do
    user = User.create!(email: "user@example.com", password: '12345678')
    list = List.create!(name: "my list", user: user)
    
    assert_equal(user, list.user)
   end
  
  test "has a user" do
    list = List.new(name: "my list")
    refute list.save, "List shouldn't have saved without a user"
    list.user = User.create!(email: "user@example.com", password: '12345678')
    assert list.save
  end
end
