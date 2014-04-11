class CreateTTypes < ActiveRecord::Migration
  def change
    create_table :t_types do |t|
    	  t.string :type_code, :limit => 15, :null => false, :unique => true
    	  t.string :article_type, :limit => 20, :null => false, :unique => true
    	  t.integer :t_user_id, null: false, index: true
    	  t.timestamps
    end
  end
end
