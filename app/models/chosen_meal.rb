class ChosenMeal < ApplicationRecord
  enum :meal_time, %i(breakfast lunch dinner snack)

  belongs_to :plan
  belongs_to :meal
end
