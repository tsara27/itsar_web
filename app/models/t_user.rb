class TUser < ActiveRecord::Base
  	attr_accessible :nme, :usrnme, :passwd, :mail, :gndr, :t_usertype_id, :t_itsar_id, :created_at, :updated_at, :id, :t_user_id

	belongs_to :t_usertype
	belongs_to :t_itsar

	has_many :t_itsars
  	has_many :t_menus
  	has_many :t_usertypes
  	has_many :t_submenus
end
