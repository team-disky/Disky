Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  devise_for :managers
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'
end
