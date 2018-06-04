class AddColumnVariablesAtLastframe < ActiveRecord::Migration[5.1]
  def change
    add_reference :last_frames, :variable, foreign_key: true
  end
end
