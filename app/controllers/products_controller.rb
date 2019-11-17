class ProductsController < ApplicationController
  def index
  	@products = Product.all.order(created_at: :desc)
  	@products = Product.page(params[:page]).per(4)
  end

  def show
  	@product = Product.find(params[:id])
  end
end
