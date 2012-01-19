class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name, null: false
    end
  end
end
