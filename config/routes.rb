Rails.application.routes.draw do
  root to: "dummy_items#index"
  devise_for :users

  post 'items/new'
  resources :items, only: [:new, :create]

end
