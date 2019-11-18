Rails.application.routes.draw do
  devise_for :managers
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :manager do
  resources :orders, :customers, :artists, :categories, :record_labels
end


namespace :manager do
  	resources :products do
  		resources :discs, only: [:create, :destroy] do
  			resources :songs, only: [:create, :destroy]
  		end
  	end
  end

namespace :manager do
	get 'products/:id/add_quantity' => 'products#add_quantity', as: 'product_add_quantity'
end

namespace :manager do
	resources :arrivals, only: [:create, :index]
end
end
