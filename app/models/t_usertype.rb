class TUsertype < ActiveRecord::Base
  attr_accessible :id,:utypename, :created_at, :updated_at, :t_user_id
  validates :utypename, :presence => true, :format => { :with => /^([-a-z ])+$/i,
    :message => "Tidak boleh diisi dengan selain a-z." }, :length => { :in => 3..25, :message => "Isian harus terdiri dari 3 sampai 25 karakter." },:uniqueness => true

  has_many :t_users
  belongs_to :t_user
end
