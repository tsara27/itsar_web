class CreateTArticles < ActiveRecord::Migration
  def change
    create_table :t_articles do |t|
      t.string :title, limit: 50, null: false
      t.string :the_text, limit: 500, null: false
      t.string :writer, limit: 25, null: false
      t.integer :t_type_id, null: false, index: true
      t.integer :t_user_id, null: false, index: true 
      t.timestamps
    end
  end
end
