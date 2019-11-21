Rails.application.routes.draw do
  devise_for :managers, controllers: {
  	sessions: 'managers/sessions',
  	passwords: 'managers/passwords',
  	registrations: 'managers/registrations'
  }
  devise_for :customers, controllers: {
  	sessions: 'customers/sessions',
  	passwords: 'customers/passwords',
  	registrations: 'customers/registrations'
  }
  devise_scope :customer do
  	post 'customers/sign_up/confirm' => 'customers/registrations#confirm'
  end
  resources :customers, only: [:show, :edit, :update ]
  get 'customers/:id/leave' => 'customers#leave', as: 'customer_leave'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  resources :products, :only => :show

  resources :cart_products

  get 'orders/select_address' => 'orders#select_address', as: "select_address"

  post 'orders/select_payment' => 'orders#select_payment', as: "select_payment"

  post 'orders/confirm' => 'orders#confirm', as: "confirm"

  get 'orders/:id/complete' => 'orders#complete', as: "complete"

  resources :orders

end
