class TUsertype < ActiveRecord::Base
  attr_accessible :id,:utypename, :created_at, :updated_at, :t_user_id
  validates :utypename, :presence => true, :format => { :with => /^([a-z ])+$/i }, :length => { :in => 3..25 },:uniqueness => true

  has_many :t_users
  belongs_to :t_user
end
