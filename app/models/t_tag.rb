class TTag < ActiveRecord::Base
  attr_accessible :tag, :t_user_id, :id
  validates :tag, :format => { :with => /^([a-z \-])+$/i }, :length => { :in => 3..20 }, :uniqueness => true
  has_many :t_article_relations
  has_many :t_articles, :through => :t_article_relations
  belongs_to :t_user
  
end