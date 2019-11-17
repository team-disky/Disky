Rails.application.routes.draw do
  devise_for :managers
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  resources :products, :only => :show

  get 'orders/select_payment' => 'orders#select_payment'
end
