Rails.application.routes.draw do
  
  get "dashboard", to: "dashboard#index"
  root 'dashboard#index'
  devise_for :users

  resources :profiles, only: %i[index show new create edit update]
  resources :orders, only: %i[show new create]
end
