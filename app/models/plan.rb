class Plan < ApplicationRecord
    has_many :chosen_meals
    has_many :meals, through: :chosen_meals, source: :meal
    belongs_to :user
end
