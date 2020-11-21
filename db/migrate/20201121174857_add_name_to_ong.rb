class AddNameToOng < ActiveRecord::Migration[6.0]
  def change
    add_column :ongs, :name, :string
  end
end
