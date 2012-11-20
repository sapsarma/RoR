require 'test_helper'

class UserfriendsControllerTest < ActionController::TestCase
  setup do
    @userfriend = userfriends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userfriends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userfriend" do
    assert_difference('Userfriend.count') do
      post :create, userfriend: { emailaddress: @userfriend.emailaddress, note: @userfriend.note }
    end

    assert_redirected_to userfriend_path(assigns(:userfriend))
  end

  test "should show userfriend" do
    get :show, id: @userfriend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userfriend
    assert_response :success
  end

  test "should update userfriend" do
    put :update, id: @userfriend, userfriend: { emailaddress: @userfriend.emailaddress, note: @userfriend.note }
    assert_redirected_to userfriend_path(assigns(:userfriend))
  end

  test "should destroy userfriend" do
    assert_difference('Userfriend.count', -1) do
      delete :destroy, id: @userfriend
    end

    assert_redirected_to userfriends_path
  end
end
