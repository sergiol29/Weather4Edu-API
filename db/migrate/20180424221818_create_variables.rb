class CreateVariables < ActiveRecord::Migration[5.1]
  def change
    create_table :variables do |t|
      t.string :code, null: false
      t.text :name, null: false
      t.text :symbol, null: false
      t.timestamps
    end
    add_index :variables, :code, unique: true
  end
end
