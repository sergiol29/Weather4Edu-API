class CreateValueMins < ActiveRecord::Migration[5.1]
  def change
    create_table :value_mins do |t|
      t.float :value
      t.datetime :timestamp
      t.timestamps
    end
  end
end
