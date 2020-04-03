Rails.application.routes.draw do
  root to: "dummy_items#index"
  devise_for :users

  post 'sell/sell'
  resources :sell, only: [:index, :new, :create]

end
