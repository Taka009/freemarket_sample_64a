Rails.application.routes.draw do
  root to: "top#index"
  devise_for :users

  post 'items/new', to: 'items#create'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end