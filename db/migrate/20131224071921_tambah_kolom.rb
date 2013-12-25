class TambahKolom < ActiveRecord::Migration
  def change
    add_column :t_users, :iduser, :string, :null => false, index: true, :default => "0"
    add_column :t_usertypes, :iduser, :string, :null => false, index: true, :default => "0"
    add_column :t_itsars, :iduser, :string, :null => false, index: true, :default => "0"
  end
end
