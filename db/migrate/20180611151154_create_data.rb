class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.references :frame, foreign_key: {on_delete: :cascade}, null: false
      t.references :station, foreign_key: {on_delete: :cascade}, null: false
      t.references :variable, foreign_key: {on_delete: :cascade}, null: false
      t.float :value
      t.integer :timestamp
      t.timestamps
    end
    add_index :data, [:frame_id, :station_id, :variable_id], unique: true
  end
end
