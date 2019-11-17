Rails.application.routes.draw do
  devise_for :managers
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

namespace :manager do
  	resources :products do
  		resources :discs, only: [:create, :destroy] do
  			resources :songs, only: [:create, :destroy]
  		end
  	end
  end
end
