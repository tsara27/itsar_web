class TUsertype < ActiveRecord::Base
  attr_accessible :id,:utypename, :created_at, :updated_at, :t_user_id
  has_many :t_users
  belongs_to :t_user
end
