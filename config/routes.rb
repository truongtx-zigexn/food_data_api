Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods, only: [ :index, :show ] do
        collection do
          get "search"
          get "list"
          get "multiple"
        end
      end
    end
  end
end
