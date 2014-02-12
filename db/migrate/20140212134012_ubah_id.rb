class UbahId < ActiveRecord::Migration
   def change
  		change_table :t_menus do |t|
  		t.rename :user_id, :t_users_id
	end
  end
end
