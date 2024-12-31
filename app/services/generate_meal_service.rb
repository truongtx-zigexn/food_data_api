class GenerateMealService
  include HTTParty

  def generate(body_request)
    self.class.post(
      "http://generate_api:8000/recommend/calo",
      body: body_request.to_json,
      headers: { "Content-Type" => "application/json" },
    )
  end

  def generate_one(body_request)
    self.class.post(
      "http://generate_api:8000/recommend/new",
      body: body_request.to_json,
      headers: { "Content-Type" => "application/json" },
    )
  end
end
