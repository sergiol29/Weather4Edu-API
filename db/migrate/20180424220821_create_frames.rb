class CreateFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :frames do |t|
      t.string :raw
      t.text :source_ip
      t.datetime :timestamp
      t.boolean :processed, default: false
      t.timestamps
    end
  end
end
