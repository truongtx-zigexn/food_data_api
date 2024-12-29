class CreateMealIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :meal_ingredients do |t|
      t.integer :fdb_id
      t.float :ingredient_qty

      t.references :meal, null: false, foreign_key: true
    end
  end
end
