Rails.application.routes.draw do
  get 'sell/sell'
  post 'sell/sell'
  resources :sell, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
