class ScoreboardController < ApplicationController
  
  def scoreboard
    @users = User.where(lock_players: true)
    @chosen_players = Player.where(selected: true)
    @usersgames = User.where(lock_games: true)
    @games = Game.all
    @first_game_date = @games.first.game_date
  end
end
