Rails.application.routes.draw do
  
  root 'sell#sell'
  post 'sell/sell'
  resources :sell, only: [:index, :new, :create] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  #post 'items', to: 'items#create'
  #resources :sells  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
