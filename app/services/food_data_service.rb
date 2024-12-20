class FoodDataService
  include HTTParty
  base_uri "#{FoodDataCentral::BASE_URL}/#{FoodDataCentral::API_VERSION}"

  def initialize
    @options = { query: { api_key: FoodDataCentral.api_key } }
  end

  def search_foods(query, page = 1, page_size = 50)
    @options[:query].merge!(
      query: query,
      pageSize: page_size,
      pageNumber: page
    )
    self.class.get("/foods/search", @options)
  end

  def get_food(fdc_id)
    self.class.get("/food/#{fdc_id}", @options)
  end

  def get_foods_list(page = 1, page_size = 50)
    @options[:query].merge!(
      pageSize: page_size,
      pageNumber: page
    )
    self.class.get("/foods/list", @options)
  end
end
