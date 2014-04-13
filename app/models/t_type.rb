class TType < ActiveRecord::Base
  attr_accessible :type_code, :article_type, :t_user_id
  validates :type_code, :presence => true, :format => { :with => /^([a-z])+$/i }, :length => { :in => 3..15 }
  validates :article_type, :presence => true, :format => { :with => /^([a-z \-])+$/i }, :length => { :in => 3..20 }
  has_many :t_articles
  belongs_to :t_user
end
