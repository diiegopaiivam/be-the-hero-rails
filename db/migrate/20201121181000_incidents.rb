class Incidents < ActiveRecord::Migration[6.0]
  def change
    create_table :incidents do |t|
      
      t.string :title
      t.text :description
      t.decimal :value

    end
  end
end
