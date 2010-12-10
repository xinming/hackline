require 'test_helper'

class FavoriteTasksControllerTest < ActionController::TestCase
  setup do
    @favorite_task = favorite_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_task" do
    assert_difference('FavoriteTask.count') do
      post :create, :favorite_task => @favorite_task.attributes
    end

    assert_redirected_to favorite_task_path(assigns(:favorite_task))
  end

  test "should show favorite_task" do
    get :show, :id => @favorite_task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @favorite_task.to_param
    assert_response :success
  end

  test "should update favorite_task" do
    put :update, :id => @favorite_task.to_param, :favorite_task => @favorite_task.attributes
    assert_redirected_to favorite_task_path(assigns(:favorite_task))
  end

  test "should destroy favorite_task" do
    assert_difference('FavoriteTask.count', -1) do
      delete :destroy, :id => @favorite_task.to_param
    end

    assert_redirected_to favorite_tasks_path
  end
end
