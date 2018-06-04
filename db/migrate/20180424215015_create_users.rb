class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name
      t.string :email, null: false
      t.text :password
      t.text :company
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
