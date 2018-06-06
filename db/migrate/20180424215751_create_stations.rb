class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.references :user, foreign_key: true, null: false
      t.text :name, null: false
      t.string :code, null: false
      t.decimal :latitude, precision: 16, scale: 12
      t.decimal :longitude, precision: 16, scale: 12
      t.timestamps
    end
    add_index :stations, :code, unique: true
  end
end
