require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  get "dashboard", to: "dashboard#index"
  root 'dashboard#index'
  devise_for :users

  resources :profiles, only: %i[show new create]
  resources :orders, only: %i[show new create]
end
