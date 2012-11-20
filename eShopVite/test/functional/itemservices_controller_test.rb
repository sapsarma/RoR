require 'test_helper'

class ItemservicesControllerTest < ActionController::TestCase
  setup do
    @itemservice = itemservices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itemservices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itemservice" do
    assert_difference('Itemservice.count') do
      post :create, itemservice: { amount: @itemservice.amount, begindate: @itemservice.begindate, enddate: @itemservice.enddate, friendslistid: @itemservice.friendslistid, itemdescription: @itemservice.itemdescription, quantity: @itemservice.quantity, siteurl: @itemservice.siteurl }
    end

    assert_redirected_to itemservice_path(assigns(:itemservice))
  end

  test "should show itemservice" do
    get :show, id: @itemservice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itemservice
    assert_response :success
  end

  test "should update itemservice" do
    put :update, id: @itemservice, itemservice: { amount: @itemservice.amount, begindate: @itemservice.begindate, enddate: @itemservice.enddate, friendslistid: @itemservice.friendslistid, itemdescription: @itemservice.itemdescription, quantity: @itemservice.quantity, siteurl: @itemservice.siteurl }
    assert_redirected_to itemservice_path(assigns(:itemservice))
  end

  test "should destroy itemservice" do
    assert_difference('Itemservice.count', -1) do
      delete :destroy, id: @itemservice
    end

    assert_redirected_to itemservices_path
  end
end
