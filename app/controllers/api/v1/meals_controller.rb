module Api
  module V1
    class MealsController < ApplicationController
      def index
        meals = Meal.all

        render json: { meals: meal }
      end

      def show
        meal = Meal.find_by(id: params[:id])
        ingredients = get_inredients(meal)
        total_nutrition = calculate_total_nutrition(ingredients)

        render json: { meal: meal,
                       ingredients: ingredients,
                       total_nutrition: total_nutrition }
      end
    end
  end
end
