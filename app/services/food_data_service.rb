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

  def search_multiple_foods(fdc_ids, format = "", nutrients = [])
    # Tạo hash để chứa các tham số query
    query_params = {}
    query_params[:api_key] =  @options[:query][:api_key]
    query_params[:format] = format unless format.blank?
    # Thêm fdcIds vào query_params
    fdc_ids.each do |id|
      query_params["fdcIds"] ||= []  # Khởi tạo mảng nếu chưa tồn tại
      query_params["fdcIds"] << id.to_s  # Thêm id vào mảng (chuyển sang string để đảm bảo)
    end

    # Thêm nutrients vào query_params
    unless nutrients.blank?
      nutrients.each do |nutrient|
        query_params["nutrients"] ||= []  # Khởi tạo mảng nếu chưa tồn tại
        query_params["nutrients"] << nutrient.to_s  # Thêm nutrient vào mảng
      end
    end


    # Tạo query string thủ công
    query_string_parts = query_params.map do |key, value|
      if value.is_a?(Array)
        # Nếu value là mảng, tạo chuỗi cho từng phần tử trong mảng
        value.map { |v| "#{key}=#{CGI.escape(v)}" }.join("&")
      else
        # Nếu value là một giá trị duy nhất
        "#{key}=#{CGI.escape(value)}"
      end
    end

    # Gộp lại các phần trong query string
    query_string = query_string_parts.join("&")

    # Tạo URL đầy đủ với query string
    url = "/foods?#{query_string}"

    # Debug output URL và query string
    puts "Final URL: #{url}"
    # Gọi API với URL đầy đủ và không cần sử dụng @options[:query]
    self.class.get(url)
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
