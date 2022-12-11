Rails.application.routes.draw do
  resources :categories
  resources :spices
  get "about", to: "about#index"
  resources :recipes
  resources :creators
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
end
