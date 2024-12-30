Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ingredients, only: [:index, :show] do
        collection do
          get "search"
          get "list"
          get "multiple"
        end
      end

      resources :meals, only: [:show, :index]
    end
  end
end
