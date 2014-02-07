class CreateMenuTable < ActiveRecord::Migration
  def up
  	create_table :t_menus do |tabel| 
  		tabel.string :menu_name, limit: 50, null: false #Menu Name
  		tabel.string :url, null: false #The URL
  		tabel.string :visible_to, null: false #For?
  		tabel.integer :iduser, null: false, index: true #Id Pengguna
  		tabel.timestamps #Update and Create timestamps
  	end
  end
end
