class CreateLastFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :last_frames do |t|
      t.float :value
      t.timestamps
    end
  end
end
