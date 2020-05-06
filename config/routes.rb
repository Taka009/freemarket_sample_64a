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
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      post 'pay', to: 'items#pay'
      get 'buy', to:'items#buy'
      get 'purchase', to:'items#purchase'
    end
  end
  resources :credits, only: [:new, :show] do
    collection do
      post 'show', to: 'credits#show'
      post 'pay', to: 'credits#pay'
      post 'delete', to: 'credits#delete'
    end
  end
  resources :mypage
  # ログアウト
  devise_scope :social_account do
    get 'sign_out', to: "sessions#destroy"
  end
end

