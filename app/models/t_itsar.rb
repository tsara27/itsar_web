class TItsar < ActiveRecord::Base
  attr_accessible :id,:gname, :schname, :created_at, :updated_at, :t_user_id

  #ITSAR group has many users
  has_many :t_users
  belongs_to :t_user
  
  has_and_belongs_to_many :t_usertypes

end
