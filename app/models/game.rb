class Game < ActiveRecord::Base
 has_many :usergames
 has_many :users, :through => :usergames    
  default_scope { order(ref: :asc) }  
end
