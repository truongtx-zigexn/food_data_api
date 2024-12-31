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
      post 'signup', to: 'users#signup'
      post 'login', to: 'users#login'
      delete 'logout', to: 'users#logout'

      resources :meals, only: %i(index show)
      resources :physical_stats, only: [:create, :update, :show]
      resources :plans, only: %i() do
        collection do
          post :index
          post :generate
        end
      end
    end
  end
end
