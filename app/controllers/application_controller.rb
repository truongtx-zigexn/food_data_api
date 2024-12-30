class ApplicationController < ActionController::API
  private

  def get_inredients(meal)
    ingredients = meal.ingredients.pluck(:fdb_id)
    format = "abridged"
    nutrients = [208, 957, 291, 203, 204, 205, 298]

    # Find and clean ingredient result
    service = FoodDataService.new
    result = clean_result(JSON.parse(service.search_multiple_foods(ingredients, format, nutrients).body))

    # Attach quantity to ingredient
    result.each { |ingredient| ingredient[:qty] = MealIngredient.find_by(fdb_id: ingredient[:fdcId])[:ingredient_qty] }
    result
  end

  def clean_result(ingredients)
    nutrient_map = {
      "Carbohydrate" => :carbs,
      "Protein" => :protein,
      "fat" => :fat,
      "Fiber" => :fiber,
      "Energy" => :calories,
    }

    ingredients.map do |ingredient|
      result = { name: ingredient["description"],
                 nutrients: { carbs: 0, protein: 0, fat: 0, fiber: 0, calories: 0 },
                 fdcId: ingredient["fdcId"] }

      ingredient["foodNutrients"].each do |nutrient|
        nutrient_map.each do |key, nutrient_key|
          if nutrient["name"].include?(key)
            result[:nutrients][nutrient_key] = nutrient["amount"]
          end
        end
      end

      result
    end
  end

  def calculate_total_nutrition(ingredients)
    total_nutrition = { carbs: 0, protein: 0, fat: 0, fiber: 0, calories: 0 }
    ingredients.each do |ingredient|
      nutrients = ingredient[:nutrients]

      total_nutrition[:carbs] += (nutrients[:carbs] * ingredient[:qty] / 100) || 0
      total_nutrition[:protein] += (nutrients[:protein] * ingredient[:qty] / 100) || 0
      total_nutrition[:fat] += (nutrients[:fat] * ingredient[:qty] / 100) || 0
      total_nutrition[:fiber] += (nutrients[:fiber] * ingredient[:qty] / 100) || 0
      total_nutrition[:calories] += (nutrients[:calories] * ingredient[:qty] / 100) || 0
    end
    total_nutrition
  end
end
