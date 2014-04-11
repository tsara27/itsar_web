class CreateTTags < ActiveRecord::Migration
  def change
    create_table :t_tags do |t|
      t.integer :t_article_id, null: false, index: true
      t.string :tag, limit: 20, null: false
      t.integer :t_user_id, null: false, index: true
      t.timestamps
    end
  end
end
