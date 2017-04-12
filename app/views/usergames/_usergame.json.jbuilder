json.extract! usergame, :id, :user_id, :game_id, :home_win, :away_win, :margin_a, :margin_b, :margin_c, :points_for_game, :created_at, :updated_at
json.url usergame_url(usergame, format: :json)
