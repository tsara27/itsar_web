class TambahKolom < ActiveRecord::Migration
  def change
    add_column :t_users, :iduser, :string, :null => false, index: true, :default => "0"
  end
end
