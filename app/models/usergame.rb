class Usergame < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  
  scope :winner_predicted, -> { where("home_win IS NOT NULL") }
  scope :winning_margin, -> { where("winning_margin IS NOT NULL") }
  
   default_scope { order(game_id: :asc) }
end
