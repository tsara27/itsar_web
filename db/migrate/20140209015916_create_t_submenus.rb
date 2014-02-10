class CreateTSubmenus < ActiveRecord::Migration
  def change
    create_table :t_submenus do |tabel|
    	tabel.integer :idpmenu, null:false, index: true #Id Parent menu
    	tabel.string :menu_name, limit: 50, null: false #Menu Name
  		tabel.string :url, null: false #The URL
  		tabel.string :visible_to, null: false #For?
  		tabel.integer :iduser, null: false, index: true #Id Pengguna
      	tabel.timestamps
    end
  end
end
