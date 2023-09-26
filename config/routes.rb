Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      resources :forecasts, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
    end
  end

end
