module Api
  module V1
    class PhysicalStatsController < ApplicationController
      before_action :authorize_request
      def create

        binding.pry

        @physical_stat = current_user.build_physical_stat(physical_stat_params)


        if @physical_stat.save
          render json: @physical_stat, status: :created
        else
          render json: { errors: @physical_stat.errors.full_messages }, status: :unprocessable_entity
        end
      end

       # GET /physical_stats/:id
      def show
        @physical_stat = PhysicalStat.find_by(id: params[:id], user_id: current_user.id)

        if @physical_stat.nil?
          render json: { errors: ['Physical stat not found'] }, status: :not_found
        else
          render json: @physical_stat, status: :ok
        end
      end

      # PATCH/PUT /physical_stats/:id
      def update
        @physical_stat = PhysicalStat.find_by(id: params[:id], user_id: current_user.id)

        if @physical_stat.nil?
          render json: { errors: ['Physical stat not found'] }, status: :not_found
        elsif @physical_stat.update(physical_stat_params)
          render json: @physical_stat, status: :ok
        else
          render json: { errors: @physical_stat.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def physical_stat_params
        params.require(:physical_stat).permit(:height, :weight, :age, :gender, :activity_lvl)
        
      end
    end
  end
end
