class UbahIdnya < ActiveRecord::Migration
  	def change

  		change_table :t_usertypes do |t|
  			t.rename :iduser, :t_user_id
  		end

  		change_table :t_itsars do |t|
  			t.rename :iduser, :t_user_id
  		end

  		change_table :t_submenus do |t|
  			t.rename :iduser, :t_user_id
  		end
	end
end
