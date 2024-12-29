class Meal < ApplicationRecord
  has_many :ingredients, class_name: MealIngredient.name, dependent: :destroy
end
