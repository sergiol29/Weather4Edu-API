class AddReferenceVariableToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :variables, :user, foreign_key: true
  end
end
