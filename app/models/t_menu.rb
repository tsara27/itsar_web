class TMenu < ActiveRecord::Base
  attr_accessible :menu_name, :url, :visible_to, :t_user_id,:id
  validates :menu_name, :presence => true, :format => { :with => /^([a-z 0-9])+$/i }, :length => { :in => 3..25 }
  validates :menu_name, :presence => true, :format => { :with => /^([a-z 0-9])+$/i }, :length => { :in => 3..25 }
  
  belongs_to :t_user
  has_many :t_submenus, :dependent => :destroy
end
