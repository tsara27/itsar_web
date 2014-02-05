class CreateTMenus < ActiveRecord::Migration
  def change
    create_table :t_menus do |t|

      t.timestamps
    end
  end
end
