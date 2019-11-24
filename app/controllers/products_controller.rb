class ProductsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  	@products = Product.all.order(created_at: :desc)
  	@products = Product.page(params[:page]).per(12)
  end

  def show
  	@product = Product.find(params[:id])
  	@cart_product = CartProduct.new
  end
end
