class CreateScreenTypes < ActiveRecord::Migration
  def change
    create_table :screen_types do |t|
      t.string :name, null: false
    end
  end
end
