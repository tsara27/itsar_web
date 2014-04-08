class AddShortname < ActiveRecord::Migration
  def change
  	add_column :t_itsars, :shortname, :string, limit: 30
  end
end
