class TUser < ActiveRecord::Base
  attr_accessible :nme, :usrnme, :passwd, :mail, :gndr, :usrtype, :itsar_id, :created_at, :updated_at, :id, :iduser

  belongs_to :t_itsar
  belongs_to :t_usertype
  has_many :t_itsars
  has_many :t_menus
end
