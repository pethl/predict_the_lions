require 'test_helper'

class UserplayersControllerTest < ActionController::TestCase
  setup do
    @userplayer = userplayers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userplayers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userplayer" do
    assert_difference('Userplayer.count') do
      post :create, userplayer: { player_id: @userplayer.player_id, selected: @userplayer.selected, user_id: @userplayer.user_id }
    end

    assert_redirected_to userplayer_path(assigns(:userplayer))
  end

  test "should show userplayer" do
    get :show, id: @userplayer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userplayer
    assert_response :success
  end

  test "should update userplayer" do
    patch :update, id: @userplayer, userplayer: { player_id: @userplayer.player_id, selected: @userplayer.selected, user_id: @userplayer.user_id }
    assert_redirected_to userplayer_path(assigns(:userplayer))
  end

  test "should destroy userplayer" do
    assert_difference('Userplayer.count', -1) do
      delete :destroy, id: @userplayer
    end

    assert_redirected_to userplayers_path
  end
end
