class CreateLastFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :last_frames do |t|
      t.integer :timestamp
      t.float :value
      t.timestamps
    end
    #add_index :frames, [:id, :station_id], unique: true
  end
end
