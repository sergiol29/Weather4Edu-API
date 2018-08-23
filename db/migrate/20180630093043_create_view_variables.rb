class CreateViewVariables < ActiveRecord::Migration[5.1]
  def change
    create_table :view_variables do |t|
      t.references :station, foreign_key: {on_delete: :cascade}, null: false
      t.references :variable, foreign_key: {on_delete: :cascade}, null: false
      t.string :name
      t.string :symbol
      t.string :color, default: "#000000"
      t.text :view_human
      t.timestamps
    end
    add_index :view_variables, [:station_id, :variable_id], unique: true
  end
end
