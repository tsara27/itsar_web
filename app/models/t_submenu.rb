class TSubmenu < ActiveRecord::Base
  attr_accessible :t_menu_id, :menu_name, :url, :visible_to, :t_user_id,:id
  validates :menu_name, :presence => true, :format => { :with => /^([a-z0-9 ])+$/i }, :length => { :in => 3..50 }
  validates :url, :presence => true, :format => { :with => /^([a-z0-9\-\/#])+$/i }, :length => { :in => 1..100 }
  
  belongs_to :t_menu
  belongs_to :t_user
end
