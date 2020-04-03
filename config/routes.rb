Rails.application.routes.draw do
  root to: "dummy_items#index"
  devise_for :users

  get 'sell/sell'
  post 'sell/sell'
  resources :sell, only: [:index, :new, :create]

end
