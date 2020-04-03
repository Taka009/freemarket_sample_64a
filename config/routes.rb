Rails.application.routes.draw do

  get 'sell/sell'
  post 'items', to: 'items#create'
  resources :sells

  root 'sell#sell'
  post 'sell/sell'
  resources :sell, only: [:index, :new, :create]

end
