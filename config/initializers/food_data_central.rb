module FoodDataCentral
  BASE_URL = 'https://api.nal.usda.gov/fdc'
  API_VERSION = 'v1'
  
  def self.api_key
    ENV['FOOD_DATA_API_KEY']
  end
end
