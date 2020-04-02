Rails.application.routes.draw do

  post 'sell/sell'
  resources :sell, only: [:index, :new, :create]

  #post 'items', to: 'items#create'
  #resources :sells
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
