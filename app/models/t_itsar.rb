class TItsar < ActiveRecord::Base
  attr_accessible :id,:gname, :schname, :created_at, :updated_at, :iduser

  #ITSAR group has many users
  has_many :t_users
  belongs_to :t_users
end
