class TArticleRelation < ActiveRecord::Base
  attr_accessible :t_article_id, :t_tag_id
  validates :t_tag_id, :uniqueness => { :scope => :t_article_id }
  belongs_to :t_tag
  belongs_to :t_article
end
