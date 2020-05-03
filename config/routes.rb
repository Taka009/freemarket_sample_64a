Rails.application.routes.draw do
  root to: "top#index"
  devise_for :users

  post 'items/new', to: 'items#create'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    member do
      post 'pay', to: 'items#pay'
      get 'buy', to:'items#buy'
    end
  end
  resources :credits, only: [:new, :show] do
    collection do
      post 'show', to: 'credits#show'
      post 'pay', to: 'credits#pay'
      post 'delete', to: 'credits#delete'
    end
  end
end