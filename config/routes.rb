Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/set_replanted_area", to: "lands#set_replanted_area"
  get "/set_replanted_area", to: "lands#set_replanted_area"
  get "/set_location", to: "lands#set_location"
  post "/set_total_area", to: "lands#set_total_area"
  post "/store_demo_value", to: "lands#store_demo_value"
end
