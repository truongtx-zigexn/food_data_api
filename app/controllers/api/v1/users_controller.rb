module Api
  module V1
    class UsersController < ApplicationController

      before_action :authorize_request, except: [:signup, :login]
      def signup
        user = User.new(user_params)
        if user.save
          token = encode_token(user.id)
          render json: { message: 'User created successfully', token: token, user_id: user.id }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          token = encode_token(user.id)
          render json: { message: 'Login successful', token: token }, status: :ok
        else
          render json: { errors: ['Invalid username or password'] }, status: :unauthorized
        end
      end

      def logout
        render json: { message: 'Logout successful' }, status: :ok
      end

      private

      def user_params
        params.require(:user).permit(:username, :password, :full_name)
      end

      def encode_token(user_id)
        payload = { user_id: user_id , exp: 4.hours.from_now.to_i}
        JWT.encode(payload, Rails.application.secret_key_base)
      end
    end
  end
end
