class RemoveArticleid < ActiveRecord::Migration
  def change
  	remove_column :t_tags, :t_article_id
  end
end
