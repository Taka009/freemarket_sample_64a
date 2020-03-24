Rails.application.routes.draw do
  get 'top/index'
  root "top#index"
  resources :items
  resources :categories
end
