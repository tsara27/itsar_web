class TMenu < ActiveRecord::Base
  attr_accessible :menu_name, :url, :visible_to, :t_user_id,:id
  validates :menu_name, :presence => true, :format => { :with => /^([a-z0-9 ])+$/i }, :length => { :in => 3..50 }
  validates :url, :presence => true, :format => { :with => /^([a-z0-9_\-\/#])+$/i }, :length => { :in => 1..100 }
  
  belongs_to :t_user
  has_many :t_submenus, :dependent => :destroy
end
