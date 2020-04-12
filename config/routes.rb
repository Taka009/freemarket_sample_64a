Rails.application.routes.draw do
  root to: "dummy_items#index"
  devise_for :users

  post 'items/new'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :tops 
end