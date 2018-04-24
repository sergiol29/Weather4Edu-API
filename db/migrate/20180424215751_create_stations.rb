class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.text :name
      t.string :code, null: false
      t.decimal :latitude, precision: 16, scale: 12
      t.decimal :longitude, precision: 16, scale: 12
      t.timestamps
    end
    add_index :stations, :code, unique: true
  end
end
