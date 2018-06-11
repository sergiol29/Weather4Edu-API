class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.references :frame, foreign_key: true
      t.references :station, foreign_key: true
      t.references :variable, foreign_key: true
      t.float :value
      t.integer :timestamp
      t.timestamps
    end
    add_index :data, [:frame_id, :station_id, :variable_id], unique: true
  end
end
