class CreateIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients do |t|
      t.integer :fdb_id
      t.integer :qty
      
      t.references :meal, null: false, foreign_key: true
      t.timestamps
    end
  end
end
