class Meal < ApplicationRecord
  has_many :ingredients, class_name: MealIngredient.name, dependent: :destroy
  has_one_attached :image
end
