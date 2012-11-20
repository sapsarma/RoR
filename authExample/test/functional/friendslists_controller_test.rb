require 'test_helper'

class FriendslistsControllerTest < ActionController::TestCase
  setup do
    @friendslist = friendslists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friendslists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friendslist" do
    assert_difference('Friendslist.count') do
      post :create, friendslist: { include: @friendslist.include, name: @friendslist.name }
    end

    assert_redirected_to friendslist_path(assigns(:friendslist))
  end

  test "should show friendslist" do
    get :show, id: @friendslist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friendslist
    assert_response :success
  end

  test "should update friendslist" do
    put :update, id: @friendslist, friendslist: { include: @friendslist.include, name: @friendslist.name }
    assert_redirected_to friendslist_path(assigns(:friendslist))
  end

  test "should destroy friendslist" do
    assert_difference('Friendslist.count', -1) do
      delete :destroy, id: @friendslist
    end

    assert_redirected_to friendslists_path
  end
end
