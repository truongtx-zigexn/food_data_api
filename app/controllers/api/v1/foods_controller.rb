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
    end
  end
end
