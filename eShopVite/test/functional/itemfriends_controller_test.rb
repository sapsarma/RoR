require 'test_helper'

class ItemfriendsControllerTest < ActionController::TestCase
  setup do
    @itemfriend = itemfriends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itemfriends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itemfriend" do
    assert_difference('Itemfriend.count') do
      post :create, itemfriend: { amount: @itemfriend.amount, comments: @itemfriend.comments, interested: @itemfriend.interested, qty: @itemfriend.qty }
    end

    assert_redirected_to itemfriend_path(assigns(:itemfriend))
  end

  test "should show itemfriend" do
    get :show, id: @itemfriend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itemfriend
    assert_response :success
  end

  test "should update itemfriend" do
    put :update, id: @itemfriend, itemfriend: { amount: @itemfriend.amount, comments: @itemfriend.comments, interested: @itemfriend.interested, qty: @itemfriend.qty }
    assert_redirected_to itemfriend_path(assigns(:itemfriend))
  end

  test "should destroy itemfriend" do
    assert_difference('Itemfriend.count', -1) do
      delete :destroy, id: @itemfriend
    end

    assert_redirected_to itemfriends_path
  end
end
