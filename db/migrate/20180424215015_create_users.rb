class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.string :email, null: false
      t.string :password_hash, null: false
      t.string :password
      t.text :company
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
