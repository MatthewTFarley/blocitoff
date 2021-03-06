require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  setup do
    @list = lists(:one)
    sign_in @list.user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list" do
    assert_difference('List.count') do
      post :create, list: { name: @list.name, user_id: @list.user_id }
    end

    assert_redirected_to list_path(assigns(:list))
  end

  test "should show list" do
    get :show, id: @list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list
    assert_response :success
  end

  test "should update list" do
    patch :update, id: @list, list: { name: @list.name, user_id: @list.user_id }
    assert_redirected_to list_path(assigns(:list))
  end
end
