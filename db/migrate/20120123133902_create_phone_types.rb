class CreatePhoneTypes < ActiveRecord::Migration
  def change
    rename_table :types, :phone_types
  end
end
