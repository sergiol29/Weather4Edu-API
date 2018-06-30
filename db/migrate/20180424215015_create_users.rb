class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :company
      t.integer :role
      t.timestamps
    end
  end
end
