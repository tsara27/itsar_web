class TMenu < ActiveRecord::Base
  attr_accessible :menu_name, :url, :visible_to, :iduser,:id

  belongs_to :t_user
  has_many :t_submenus
end
