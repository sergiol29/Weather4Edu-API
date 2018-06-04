class AddColumnVariablesAtLastframe < ActiveRecord::Migration[5.1]
  def change
    add_column :LastFrame, :variable, :integer
    add_reference :variable, :LastFrame, foreign_key: true
  end
end
