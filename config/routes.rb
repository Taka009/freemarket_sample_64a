Rails.application.routes.draw do
  get 'sell/sell'
  post 'items', to: 'items#create'
  resources :sells
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
