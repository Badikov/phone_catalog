class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :name, null: false
      t.integer :weight
      t.decimal :screen_size, precision: 2, scale: 2
      t.boolean :contain_touch_screen, default: false
      t.boolean :contain_3g, default: false
      t.boolean :contain_wifi, default: false
      t.boolean :contain_bluetooth, default: false
      t.boolean :contain_gps, default: false
      t.boolean :contain_memory_card, default: false
      t.boolean :contain_mp3_player, default: false
      t.boolean :contain_radio, default: false
      t.boolean :contain_double_sim_support, default: false
      t.boolean :contain_camera, default: false
      t.string :image, null: false
      t.string :big_image

      t.references :vendor
      t.references :case_type
      t.references :phone_type
      t.references :platform
      t.references :screen_type
      t.references :touch_screen_type
    end
  end
end
