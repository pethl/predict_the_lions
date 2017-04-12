class Userplayer < ActiveRecord::Base
  belongs_to :user
  belongs_to :player
  
   default_scope { order(player_id: :asc) }
end
