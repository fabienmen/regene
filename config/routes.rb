Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/set_replanted_area", to: "lands#set_replanted_area"
  get "/set_location", to: "lands#set_location"
  get "/set_total_area", to: "lands#set_total_area"
  post "/store_demo_value", to: "lands#store_demo_value"
  post "/store_demo_biome", to: "lands#store_demo_biome"
  get '/offer', to: 'pages#offer', as: 'user_root'
  post "/store_replanted", to: "lands#store_replanted"
  get '/meu_perfil', to: 'pages#meu_perfil'
  get "/my_offers", to: "offers#index"


  resources :offers, only: [:edit, :update, :destroy, :show] do
    member do
      get "edit_set_replanted_area"
      patch "set_replanted_area", to: "offers#update_set_replanted_area"
      post "/edit_store_replanted", to: "offers#edit_store_replanted"
      get "edit_set_location"
      patch "set_location", to: "offers#update_set_location"
      post "/store_edit_value", to: "offers#store_edit_value"
      post "/store_edit_biome", to: "offers#store_edit_biome"
      get "edit_set_total_area"
      patch "set_total_area", to: "offers#update_set_total_area"

    end
  end

  resources :lands, only: [:edit, :update]
end
