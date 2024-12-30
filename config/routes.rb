Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ingredients, only: %i(index show) do
        collection do
          get :search
          get :list
          get :multiple
        end
      end

      resources :meals, only: %i(index show)

      resources :plans, only: %i() do
        collection do
          post :index
          post :generate
        end
      end
    end
  end
end
