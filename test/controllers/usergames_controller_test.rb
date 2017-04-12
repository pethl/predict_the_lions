require 'test_helper'

class UsergamesControllerTest < ActionController::TestCase
  setup do
    @usergame = usergames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usergames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usergame" do
    assert_difference('Usergame.count') do
      post :create, usergame: { away_win: @usergame.away_win, game_id: @usergame.game_id, home_win: @usergame.home_win, margin_a: @usergame.margin_a, margin_b: @usergame.margin_b, margin_c: @usergame.margin_c, points_for_game: @usergame.points_for_game, user_id: @usergame.user_id }
    end

    assert_redirected_to usergame_path(assigns(:usergame))
  end

  test "should show usergame" do
    get :show, id: @usergame
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usergame
    assert_response :success
  end

  test "should update usergame" do
    patch :update, id: @usergame, usergame: { away_win: @usergame.away_win, game_id: @usergame.game_id, home_win: @usergame.home_win, margin_a: @usergame.margin_a, margin_b: @usergame.margin_b, margin_c: @usergame.margin_c, points_for_game: @usergame.points_for_game, user_id: @usergame.user_id }
    assert_redirected_to usergame_path(assigns(:usergame))
  end

  test "should destroy usergame" do
    assert_difference('Usergame.count', -1) do
      delete :destroy, id: @usergame
    end

    assert_redirected_to usergames_path
  end
end
