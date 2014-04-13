class CreateTArticleRelations < ActiveRecord::Migration
  def change
    create_table :t_article_relations do |t|
      t.integer :t_article_id, null: false, index: true
      t.integer :t_tag_id, null: false, index: true
      t.timestamps
    end
  end
end
