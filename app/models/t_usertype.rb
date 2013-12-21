class TUsertype < ActiveRecord::Base
  attr_accessible :id,:utypename, :created_at, :updated_at
  has_many :t_users
end
