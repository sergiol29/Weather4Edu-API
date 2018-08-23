class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.references :user, foreign_key: {on_delete: :cascade}, null: false
      t.text :name
      t.string :code, null: false
      t.decimal :latitude, precision: 16, scale: 12, default: 37.197055
      t.decimal :longitude, precision: 16, scale: 12, default: -3.6245507
      t.timestamps
    end
    add_index :stations, :code, unique: true
  end
end
