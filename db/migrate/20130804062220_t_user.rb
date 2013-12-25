class TUser < ActiveRecord::Migration
  def change
  	create_table :t_users do |tabel| 
  		tabel.string :nme, limit: 45, null: false #Name
  		tabel.string :usrnme, limit: 25, null: false, :unique => true #Username
  		tabel.string :passwd, limit: 100, null: false #Password
  		tabel.string :mail, limit: 25, null: false #Email
  		tabel.integer :gndr, limit: 1, null: false, index: true #Gender
  		tabel.integer :usrtype, limit: 1, null: false, index: true #Usertype
  		tabel.integer :itsar_id, limit: 1, null: false, index: true #Id ITSAR
      tabel.integer :iduser, null: false, index: true #Id Pengguna
  		tabel.timestamps #Update and Create timestamps

  	end

  	create_table :t_itsars do |t|
      t.string :gname, limit: 25, :null => false, :unique => true #Name of ITSAR Branch
  		t.string :schname, limit: 25, :null => false #Name of School
  		t.timestamps #Update and Create timestamps
  	end

  	create_table :t_usertypes do |tbl|
  		tbl.string :utypename, limit: 25, :null => false, :unique => true #Usertype name
  		tbl.timestamps #Update and Create timestamps
  	end
  end

end
