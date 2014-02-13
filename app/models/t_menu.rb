class TMenu < ActiveRecord::Base
  attr_accessible :menu_name, :url, :visible_to, :t_user_id,:id

  belongs_to :t_user
  has_many :t_submenus, :dependent => :destroy
end
