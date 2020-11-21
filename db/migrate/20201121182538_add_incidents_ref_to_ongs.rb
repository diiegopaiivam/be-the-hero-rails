class AddIncidentsRefToOngs < ActiveRecord::Migration[6.0]
  def change
    add_reference :ongs, :incidents, null: false, foreign_key: true
  end
end
