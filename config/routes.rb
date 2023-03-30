Rails.application.routes.draw do
  resources :races
  resources :skills
  resources :weapon_properties
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :magic_items
  resources :items
  resources :languages
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
