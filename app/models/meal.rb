class Meal < ApplicationRecord
    has_many :ingredients, dependent: :destroy
end
