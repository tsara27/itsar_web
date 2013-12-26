class TUser < ActiveRecord::Base
  attr_accessible :nme, :usrnme, :passwd, :mail, :gndr, :usrtype, :itsar_id, :created_at, :updated_at,:iduser

  belongs_to :t_itsars
  belongs_to :t_usertypes
  has_many :t_itsars
end
