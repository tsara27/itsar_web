class TItsar < ActiveRecord::Base
  attr_accessible :id,:gname, :schname, :created_at, :updated_at

  #ITSAR group has many users
  has_many :t_users
end
