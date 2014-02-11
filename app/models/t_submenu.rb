class TSubmenu < ActiveRecord::Base
  attr_accessible :idpmenu, :menu_name, :url, :visible_to, :iduser,:id

  belongs_to :t_menus
end
