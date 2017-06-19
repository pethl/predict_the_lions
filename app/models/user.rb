class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
 has_many :games, :through => :usergames
 has_many :players, :through => :userplayers
 has_many :userplayers 
 has_many :usergames
 
 accepts_nested_attributes_for :userplayers, :allow_destroy => true
 accepts_nested_attributes_for :usergames, :allow_destroy => true
 
  validates :name, presence: true, length: { maximum: 40 }
    validates :initials, presence: true, length: { maximum: 4 }
  
   default_scope { order(name: :asc) }   
end
