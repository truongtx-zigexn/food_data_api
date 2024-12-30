module Api
  module V1
    class MealsController < ApplicationController
      def index
        meals = Meal.all

        render json: { meals: meals }
      end

      def show
        meal = Meal.find_by(id: params[:id])
        ingredients = get_ingredients(meal)
        meal_nutrition = calculate_meal_nutrition(ingredients)

        render json: { name: meal.name,
                       img_url: meal.img_url,
                       ingredients: ingredients,
                       meal_nutrition: meal_nutrition }
      end
    end
  end
end
