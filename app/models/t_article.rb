class TArticle < ActiveRecord::Base
  attr_accessible :title, :the_text, :writer, :t_type_id, :t_user_id
  validates :title, :presence => true, :format => { :with => /^([a-z 0-9!?])+$/i }, :length => { :in => 3..50 }
  validates :writer, :presence => true, :format => { :with => /^([a-z .,])+$/i }, :length => { :in => 3..25 }
  has_many :t_article_relations
  has_many :t_tags, :through => :t_article_relations, :uniq => true
  belongs_to :t_user
  belongs_to :t_type
end
