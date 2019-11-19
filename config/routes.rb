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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  resources :products, :only => :show

  resources :cart_products

  get 'orders/select_payment' => 'orders#select_payment'
end
