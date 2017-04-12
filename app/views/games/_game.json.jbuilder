json.extract! game, :id, :game_date, :ref, :home_team, :away_team, :location, :home_score, :away_score, :gap, :created_at, :updated_at
json.url game_url(game, format: :json)
