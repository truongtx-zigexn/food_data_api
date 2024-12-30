class CreateChosenMeals < ActiveRecord::Migration[7.2]
  def change
    create_table :chosen_meals do |t|
      t.integer :meal_time
      t.integer :meal_qty

      t.references :plan, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.timestamps
    end
  end
end
