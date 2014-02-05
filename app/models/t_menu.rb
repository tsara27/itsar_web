class TMenu < ActiveRecord::Base
  attr_accessible :menu_name, :url, :visible_to, :iduser

  belongs_to :t_users
end
