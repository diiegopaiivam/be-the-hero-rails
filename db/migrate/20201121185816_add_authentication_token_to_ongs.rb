class AddAuthenticationTokenToOngs < ActiveRecord::Migration[6.0]
  def change
    add_column :ongs, :authentication_token, :string, limit: 30
    add_index :ongs, :authentication_token, unique: true
  end
end
