class CreateTouchScreenTypes < ActiveRecord::Migration
  def change
    create_table :touch_screen_types do |t|
      t.string :name, null: false
    end
  end
end
