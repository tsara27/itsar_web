class CreateTProfiles < ActiveRecord::Migration
  def change
    create_table :t_profiles do |t|
	  t.string :shortname_itsar, limit: 30, null: false, :unique => true, index: true
  	  t.text :self_profile, null: false
      t.integer :t_user_id, null: false, index: true #Id Pengguna
  	  t.timestamps #Update and Create timestamps
    end
  end
end
