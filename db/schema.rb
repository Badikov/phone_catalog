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

ActiveRecord::Schema.define(:version => 20120318161619) do

  create_table "case_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "phone_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "phones", :force => true do |t|
    t.string  "name",                                                                        :null => false
    t.integer "weight"
    t.decimal "screen_size",                :precision => 4, :scale => 2
    t.boolean "contain_touch_screen",                                     :default => false
    t.boolean "contain_3g",                                               :default => false
    t.boolean "contain_wifi",                                             :default => false
    t.boolean "contain_bluetooth",                                        :default => false
    t.boolean "contain_gps",                                              :default => false
    t.boolean "contain_memory_card",                                      :default => false
    t.boolean "contain_mp3_player",                                       :default => false
    t.boolean "contain_radio",                                            :default => false
    t.boolean "contain_double_sim_support",                               :default => false
    t.boolean "contain_camera",                                           :default => false
    t.string  "image",                                                                       :null => false
    t.string  "big_image"
    t.integer "vendor_id"
    t.integer "case_type_id"
    t.integer "phone_type_id"
    t.integer "platform_id"
    t.integer "screen_type_id"
    t.integer "touch_screen_type_id"
  end

  create_table "platforms", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "screen_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "touch_screen_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string "name", :null => false
  end

end
