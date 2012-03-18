class PhonesChangeScreenSizeType < ActiveRecord::Migration
  def up
    change_column :phones, :screen_size, :decimal, precision: 4, scale: 2
  end

  def down
    change_column :phones, :screen_size, :decimal, precision: 2, scale: 2
  end
end
