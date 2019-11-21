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

  resources :customers, only: [:show, :edit, :update ] do
  	resources :registration_addresses, only: [:create, :destroy]
  end

  get 'customers/:id/leave' => 'customers#leave', as: 'customer_leave'
  get 'customers/:id/edit_password' => 'customers#edit_password', as: 'customer_edit_password'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  resources :products, :only => :show

  resources :cart_products

  get 'orders/select_payment' => 'orders#select_payment'
end
