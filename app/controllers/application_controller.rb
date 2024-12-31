class ApplicationController < ActionController::API
  def current_user
    token = request.headers['Authorization']
    if token.present?
      decoded_token = decode_token(token)
      Rails.logger.info("Decoded Token: #{decoded_token}") # Log để kiểm tra payload
      @current_user ||= User.find(decoded_token['user_id']) if decoded_token.present? # Đảm bảo dùng string key
    end
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.error("User not found: #{e.message}")
    nil
  end
  def decode_token(token)
    begin
      token = token.split(' ').last if token.present?
      decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
      Rails.logger.info("Decoded Token: #{decoded}")
      decoded
    rescue JWT::ExpiredSignature
      Rails.logger.error("Token has expired")
      nil
    rescue JWT::DecodeError => e
      Rails.logger.error("JWT Decode Error: #{e.message}")
      nil
    end
  end

  def authorize_request
    render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user
  end

  private

  def get_ingredients(meal)
    ingredients = meal.ingredients.pluck(:fdb_id)
    format = "abridged"
    nutrients = [208, 957, 291, 203, 204, 205, 298]

    # Find and clean ingredient result
    service = FoodDataService.new
    result = clean_result(JSON.parse(service.search_multiple_foods(ingredients, format, nutrients).body))

    # Attach quantity to ingredient
    result.each { |ingredient|
      ingredient[:ingredient_qty] = MealIngredient.
        find_by(fdb_id: ingredient[:fdcId])[:ingredient_qty]
    }
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

  def calculate_meal_nutrition(ingredients)
    meal_nutrition = { carbs: 0, protein: 0, fat: 0, fiber: 0, calories: 0 }
    ingredients.each do |ingredient|
      nutrients = ingredient[:nutrients]

      meal_nutrition[:carbs] += (nutrients[:carbs] * ingredient[:ingredient_qty] / 100) || 0
      meal_nutrition[:protein] += (nutrients[:protein] * ingredient[:ingredient_qty] / 100) || 0
      meal_nutrition[:fat] += (nutrients[:fat] * ingredient[:ingredient_qty] / 100) || 0
      meal_nutrition[:fiber] += (nutrients[:fiber] * ingredient[:ingredient_qty] / 100) || 0
      meal_nutrition[:calories] += (nutrients[:calories] * ingredient[:ingredient_qty] / 100) || 0
    end
    meal_nutrition
  end
end
