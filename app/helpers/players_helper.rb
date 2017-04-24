module PlayersHelper
  
  def cell(user, player_id)
    if Userplayer.where(user_id: user, player_id: player_id, selected: true).any?
      return true
    else
      return false
    end
  end
 
  def points_for_correct_squad_player(user_id)
     @squad_players = Player.where(selected: true).pluck(:id)
     @squad_selected_by_user = Userplayer.where(user_id: user_id, selected: true).pluck(:player_id)
     @points = @squad_players & @squad_selected_by_user
     return @points.length
  end
  
  def points_scored_for_game(game_id, user_id)
      if who_won(game_id)==who_did_you_predict_to_win(game_id, user_id)
       return 1
    else
      0
    end
  end
  
  def points_scored_for_correct_margin(game_id, user_id)
     if User.find(user_id).lock_games==true
    usergame = Usergame.where(game_id: game_id, user_id: user_id).first
    if points_margin(game_id)==usergame.winning_margin
      return 1
    else
      0
    end
     end
  end
  
  def total_points_per_game(game_id, user_id)
    game_points = points_scored_for_game(game_id, user_id)
    margin_points = points_scored_for_correct_margin(game_id, user_id)
    return (game_points+margin_points)
  end
  
  def total_points_for_competition(user_id)
     if User.find(user_id).lock_games==true && (User.find(user_id).lock_players == true)
    game_points = points_for_all_games(user_id)
    margin_points = points_for_all_game_margins(user_id)
    squad_points = points_for_correct_squad_player(user_id)
    return (game_points+margin_points+squad_points)
     end
  end
  
  def points_for_all_games(user_id)
    @all_games = Game.all.pluck(:id)
    total = 0
    @all_games.each do |game|
      total += points_scored_for_game(game, user_id)
    end
    return total
  end
  
  def points_for_all_game_margins(user_id)
      if User.find(user_id).lock_games==true
    @all_games = Game.all.pluck(:id)
    total = 0
    @all_games.each do |game|
      total += points_scored_for_correct_margin(game, user_id)
    end
    return total
  end
  end
  
  #NOT WORKING
  def who_is_the_leader
    @users_ids = User.where("lock_games=? AND lock_players=?", true, true).pluck(:id)
    @user_scores = Hash.new
      @users_ids .each do |user|
         @user_scores[user] = total_points_for_competition(user)
      end
    #  @user_scores = @user_scores[h.sort_by{ |_, v| -v }]
      @user_scores= @user_scores.sort_by {|_key, value| value}.reverse!
     highest = @user_scores.first[1]
     @user_scores.each do |key, array|
       unless array[1] == highest
         @user_scores.delete(key)
       end
     end
     return @user_scores[0][1]
  end  
  
  def users_scores_hash
    @theusers = User.where("lock_games=? AND lock_players=?", true, true).pluck("id")
    # @theusers = User.where(lock_players: true).pluck("id")
    @leaderboard=Hash.new
    @theusers.each do |user|
    @leaderboard[user] = total_points_for_competition(user)
    end
    return  @leaderboard.sort_by {|_key, value| value}.reverse!
    
  end  
  
  def users_scores_for_squad_hash
    @alltheusers = User.where(lock_players: true).pluck("id")
    @leaderboard=Hash.new
    @alltheusers.each do |user|
    @leaderboard[user] = points_for_correct_squad_player(user)
    end
    return  @leaderboard.sort_by {|_key, value| value}.reverse!
    
  end  
end
