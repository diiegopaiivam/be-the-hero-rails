class CreateIncidents < ActiveRecord::Migration[6.0]
  def change
    create_table :incidents do |t|
      t.string :title
      t.text :description
      t.decimal :value
      t.references :ong, null: false, foreign_key: true

      t.timestamps
    end
  end
end
