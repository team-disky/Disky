class ProductsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  	@q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).where(active_flag: true).where(status: "販売中").page(params[:page]).per(12)
  end

  def show
  	@product = Product.find(params[:id])
  	@cart_product = CartProduct.new
  end
end
