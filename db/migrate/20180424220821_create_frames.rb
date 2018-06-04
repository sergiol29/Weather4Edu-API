class CreateFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :frames do |t|
      t.belongs_to :station, foreign_key: true
      t.string :raw
      t.text :source_ip
      t.datetime :timestamp
      t.boolean :processed, default: false
      t.references :station, index: true
      t.timestamps
    end
    #add_index :frames, :id, unique: true
  end
end
