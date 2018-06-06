class AddColumnVariablesAtLastframe < ActiveRecord::Migration[5.1]
  def change
    add_reference :last_frames, :station, foreign_key: true
    add_reference :last_frames, :variable, foreign_key: true
    add_index :last_frames, [:station_id, :variable_id], unique: true
  end
end
