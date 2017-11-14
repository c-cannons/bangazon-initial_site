Rails.application.routes.draw do
  resources :order_details
  resources :orders
  resources :payment_methods
  resources :products
  resources :product_types
  resources :customers

  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
