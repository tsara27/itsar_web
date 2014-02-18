class TItsar < ActiveRecord::Base
  attr_accessible :id,:gname, :schname, :created_at, :updated_at, :t_user_id
  validates :gname, :presence => true, :format => { :with => /^([a-z 0-9])+$/i }, :length => { :in => 3..25 }
  validates :schname, :presence => true, :format => { :with => /^([a-z 0-9])+$/i }, :length => { :in => 3..25 }

  #ITSAR group has many users
  has_many :t_users
  belongs_to :t_user
end
