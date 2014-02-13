class TSubmenu < ActiveRecord::Base
  attr_accessible :t_menu_id, :menu_name, :url, :visible_to, :t_user_id,:id

  belongs_to :t_menu
  belongs_to :t_user
end
