module ApplicationHelper
  
  def game_prediction_progress(user)
    games_predicted = user.usergames.where("home_win IS NOT NULL").count
    margins_predicted = user.usergames.where("winning_margin IS NOT NULL").count
    total = games_predicted+margins_predicted
    value = total/20.0
    return (value*100).to_i  
  end
  
  def individual_game_prediction_progress(game_id)
    usergame = Usergame.where(game_id: game_id).first
    if (!usergame.home_win== nil) && (!usergame.winning_margin== nil)
      return false
    else 
      return true
    end  
  end
  
  def points_margin(game_id)
    game = Game.find(game_id)
    if game.gap.present?
      case game.gap
      when 0
        return "Draw"  
      when 1,2,3,4,5,6,7
        return "A"
      when 8,9,10,11,12,13,14
        return "B"
      when 15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40
        return "C"
      end
    else
      return "MISSING"
    end    
  end
  
  def reverse_points_margin(value)
    case value 
    when "A"
      return "1-7"
    when "B"
      return "8-14"
    when "C"
      return "15+"
    end
  end
  
  def who_won(game_id)
    game = Game.find(game_id)
     if game.gap.present?
       if game.home_score >game.away_score
         return "Home"
        elsif game.home_score <game.away_score
          return "Lions"
        else
          return "Draw"
        end
      else
       return 
     end  
   end
  
   def who_did_you_predict_to_win(game_id, user_id)
     if User.find(user_id).lock_games==true
     if Usergame.where(game_id: game_id, user_id: user_id).first.home_win == true 
       return "Home"
      else
        return "Lions"
    end
  
end
  end 
   
  def point_for_outcome(game_id, home_win)
    game = Game.find(game_id)
     if game.gap.present?
       winner = who_won(game_id)
       if ((home_win == true) && (winner== "Home"))
         return 1
       elsif   ((home_win == false) && (winner== "Lions"))
         return 1
       else
         return 0
       end
     end
   end
   
  def completeness_check(usergame_id)
    usergames = Usergame.winner_predicted.winning_margin.pluck(:id)
    if usergames.include? usergame_id
      return true
    else
      return false
    end
  end 
  
 
end
