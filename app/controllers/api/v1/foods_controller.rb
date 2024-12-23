module Api
  module V1
    class FoodsController < ApplicationController
      def search
        service = FoodDataService.new
        result = service.search_foods(
          params[:query],
          params[:page],
          params[:per_page]
        )
        render json: result
      end

      def multiple
        # binding.pry
        # Ex: http://127.0.0.1:3000/api/v1/foods/multiple?fdc_ids=2219707,2219708&nutrients=205,203&format=full
        # Chuyển đổi các tham số từ dạng chuỗi sang mảng
        fdc_ids = params[:fdc_ids].split(",") if params[:fdc_ids]
        nutrients = params[:nutrients].split(",") if params[:nutrients]
        format = params[:format]
        service = FoodDataService.new
        result = service.search_multiple_foods(
          fdc_ids,
          format,
          nutrients
        )

        render json: result.body
      end

      def show
        service = FoodDataService.new
        result = service.get_food(params[:id])
        render json: result
      end

      def index
        service = FoodDataService.new
        result = service.get_foods_list(
          params[:page],
          params[:per_page]
        )
        render json: result
      end

      def list
        service = FoodDataService.new
        result = service.get_foods_list(
          params[:page],
          params[:per_page]
        )
        render json: result
      end
    end
  end
end
