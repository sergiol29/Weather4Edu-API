class CreateValueMaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :value_maxes do |t|
      t.references :station, foreign_key: {on_delete: :cascade}, null: false
      t.references :variable, foreign_key: {on_delete: :cascade}, null: false
      t.float :value, default: -8388607 #value min MEDIUMINT type
      t.integer :timestamp
      t.timestamps
    end
    add_index :value_maxes, [:station_id, :variable_id], unique: true
  end
end
