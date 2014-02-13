# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140212134251) do

  create_table "t_itsars", :force => true do |t|
    t.string   "gname",      :limit => 25,                  :null => false
    t.string   "schname",    :limit => 25,                  :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "t_user_id",                :default => "0", :null => false
  end

  create_table "t_menus", :force => true do |t|
    t.string   "menu_name",  :limit => 50, :null => false
    t.string   "url",                      :null => false
    t.string   "visible_to", :limit => 2,  :null => false
    t.integer  "t_user_id",                :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "t_menus", ["t_user_id"], :name => "iduser"

  create_table "t_submenus", :force => true do |t|
    t.integer  "t_menu_id",                :null => false
    t.string   "menu_name",  :limit => 50, :null => false
    t.string   "url",                      :null => false
    t.string   "visible_to",               :null => false
    t.integer  "t_user_id",                :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "t_users", :force => true do |t|
    t.string   "nme",           :limit => 45,  :null => false
    t.string   "usrnme",        :limit => 25,  :null => false
    t.string   "passwd",        :limit => 100, :null => false
    t.string   "mail",          :limit => 25,  :null => false
    t.integer  "gndr",          :limit => 1,   :null => false
    t.integer  "t_usertype_id", :limit => 1,   :null => false
    t.integer  "t_itsar_id",    :limit => 1,   :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "t_user_id"
  end

  create_table "t_usertypes", :force => true do |t|
    t.string   "utypename",  :limit => 25,                  :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "t_user_id",                :default => "0", :null => false
  end

end
