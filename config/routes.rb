Rails.application.routes.draw do

  get 'sessions/new'

  resources :order_details
  resources :orders
  resources :payment_methods
  resources :products do
    collection do
      get :search
    end
  end
  resources :product_types
  resources :customers
  resources :sessions

  get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'new_pay', to: 'payment_methods#new', as: 'new_pay'

  get 'search', to: 'products#search', as: 'search'

  post 'add_to_cart/:product_id', to: 'order_details#create', as: 'add_to_cart'

  get 'complete_order', to: 'order_details#complete_order', as: 'complete_order'

  delete 'clear_cart', to: 'order_details#clear_cart', as: 'clear_cart'

  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
