Rails.application.routes.draw do
  get 'sell/sell_form'
  post 'items', to: 'items#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
