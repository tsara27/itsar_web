class TUser < ActiveRecord::Base
  attr_accessible :nme, :usrnme, :passwd, :mail, :gndr, :t_usertype_id, :t_itsar_id, :created_at, :updated_at, :id, :t_user_id

  validates :nme, :presence => true, :format => { :with => /^([a-z ])+$/i }, :length => { :in => 2..45 }
  validates :usrnme, :presence => true, :format => { :with => /^([a-z0-9_])+$/i }, :length => { :in => 5..25 }
  validates :passwd, :confirmation => true, :presence => true, :length => { :in => 5..25 }
  validates :mail, :presence => true, :format => { :with => /^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/i }, :length => { :in => 5..25 }
  validates :gndr, :presence => true
  validates :t_usertype_id, :presence => true
  validates :t_itsar_id, :presence => true
  validates :t_user_id, :presence => true

  before_save :enc_passwd 
  after_save :clear_passwd

  belongs_to :t_usertype
  belongs_to :t_itsar

  has_many :t_itsars
  has_many :t_types
  has_many :t_profiles
  has_many :t_menus
  has_many :t_usertypes
  has_many :t_submenus

  protected 
  def enc_passwd
      self.passwd = Base64.encode64(passwd)
  end

  def clear_passwd
      self.passwd = nil
  end
end
