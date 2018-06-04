class CreateLastFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :last_frames do |t|
      t.belongs_to :station, foreign_key: true
      t.float :value
      t.datetime :timestamp
      t.timestamps
    end
    #add_index :last_frames, :station_id
    #add_index :last_frames, :id
  end
end
