class AddColorToVariables < ActiveRecord::Migration[5.1]
  def change
    add_column :variables, :color, :string, default: "#000000"
  end
end
