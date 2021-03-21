Rails.application.routes.draw do
  get "dashboard", to: "dashboard#index"
  root 'dashboard#index'
  devise_for :users

  resources :profiles, only: %i[show new create]

end
