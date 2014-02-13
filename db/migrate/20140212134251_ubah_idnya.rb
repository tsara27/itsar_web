class UbahIdnya < ActiveRecord::Migration
  	def change

      change_table :t_submenus do |t|
        t.rename :idpmenu, :t_menu_id
      end
	end
end
