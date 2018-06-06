class CreateValueMins < ActiveRecord::Migration[5.1]
  def change
    create_table :value_mins do |t|
      t.references :station, foreign_key: true
      t.references :variable, foreign_key: true
      t.float :value, default: 8388607 #value max MEDIUMINT type
      t.datetime :timestamp
      t.timestamps
    end
    add_index :value_mins, [:station_id, :variable_id], unique: true
  end
end
