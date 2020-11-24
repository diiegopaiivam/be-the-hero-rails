class AddContactToOng < ActiveRecord::Migration[6.0]
  def change
    add_column :ongs, :contact, :string
  end
end
