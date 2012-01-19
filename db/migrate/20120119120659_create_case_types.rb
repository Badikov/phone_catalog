class CreateCaseTypes < ActiveRecord::Migration
  def change
    create_table :case_types do |t|
      t.string :name, null: false
    end
  end
end
