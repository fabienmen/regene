Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/set_replanted_area", to: "lands#set_replanted_area"
  get "/set_replanted_area", to: "lands#set_replanted_area"
  get "/set_location", to: "lands#set_location"
  get "/set_total_area", to: "lands#set_total_area"
  # post "/new_offer", to: "lands#new_offer"
  post "/store_demo_value", to: "lands#store_demo_value"
  get '/offer', to: 'pages#offer', as: 'user_root'
  # post '/offer', to: 'pages#offer', as: 'user_root'
  post "/store_replanted", to: "lands#store_replanted"
end
