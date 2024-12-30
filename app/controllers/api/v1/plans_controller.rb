module Api
  module V1
    class PlansController < ApplicationController
      def index
        plan = Plan.includes(:meals, :chosen_meals)
          .find_by(apply_date: params[:apply_date])

        return render json: { msg: "Plan has not been created" } if plan.nil?

        render json: { **get_render_data(plan) }
      end

      def generate
        # Call AI API
        meal_ids = [2, 3, 4, 5]

        plan = Plan.find_by(apply_date: params[:apply_date])
        meals = Meal.find(meal_ids)
        chosen_meals = meals.map.with_index do |meal, index|
          {
            meal: meal,
            meal_qty: 1,
            meal_time: ChosenMeal.meal_times.key(index % ChosenMeal.meal_times.count),
          }
        end

        ActiveRecord::Base.transaction do
          # Create new plan if there is no plan
          plan = Plan.create! user: User.first, apply_date: params[:apply_date] unless plan.present?

          plan.meals.clear
          plan.chosen_meals.create!(chosen_meals)
        end

        render json: { **get_render_data(plan) }
      end

      private

      def get_meal(meal)
        ingredients = get_ingredients(meal)
        meal_nutrition = calculate_meal_nutrition(ingredients)

        { name: meal.name,
          img_url: meal.img_url,
          ingredients: ingredients,
          meal_nutrition: meal_nutrition }
      end

      def calculate_plan_nutrition(meals)
        plan_nutrition = { carbs: 0, protein: 0, fat: 0, fiber: 0, calories: 0 }
        meals.each do |meal|
          meal_nutrition = meal[:meal_nutrition]
          plan_nutrition[:carbs] += meal_nutrition[:carbs] * meal[:meal_qty] || 0
          plan_nutrition[:protein] += meal_nutrition[:protein] * meal[:meal_qty] || 0
          plan_nutrition[:fat] += meal_nutrition[:fat] * meal[:meal_qty] || 0
          plan_nutrition[:fiber] += meal_nutrition[:fiber] * meal[:meal_qty] || 0
          plan_nutrition[:calories] += meal_nutrition[:calories] * meal[:meal_qty] || 0
        end
        plan_nutrition
      end

      def get_render_data(plan)
        meals = plan.chosen_meals.map do |chosen_meal|
          { **get_meal(chosen_meal.meal),
           meal_qty: chosen_meal.meal_qty,
           meal_time: chosen_meal.meal_time }
        end
        plan_nutrition = calculate_plan_nutrition(meals)
        { meals: meals, plan_nutrition: plan_nutrition }
      end
    end
  end
end
