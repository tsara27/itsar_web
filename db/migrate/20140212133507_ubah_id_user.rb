class UbahIdUser < ActiveRecord::Migration
  def down
  	change_table :t_menus do |t|
  		t.rename :iduser, :t_users_id
	end
  end
end
