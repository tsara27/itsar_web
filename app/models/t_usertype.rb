class TUsertype < ActiveRecord::Base
  attr_accessible :id,:utypename, :created_at, :updated_at, :iduser
  has_many :t_users
  belongs_to :t_users
end
