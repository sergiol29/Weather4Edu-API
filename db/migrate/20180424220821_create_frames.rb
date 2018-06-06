class CreateFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :frames do |t|
      t.references :station, foreign_key: true
      t.text :raw, null: false
      t.string :source_ip
      t.datetime :timestamp
      t.boolean :processed, default: false
      t.timestamps
    end
    add_index :frames, [:id, :station_id], unique: true
  end
end
