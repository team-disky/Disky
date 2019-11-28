class ProductsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  	@q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).where(active_flag: true).where(status: "販売中").page(params[:page]).per(12)
  end

  def show
  	@product = Product.find(params[:id])

  	#配列を生成
    @current_stock_array = []
  	#商品の在庫数まで、ループを回す
    @product.stock.times do |count|

  	#countが10未満かどうか？
    	if count < 10
  	#countは0からスタートしているので、1を足した数を入れる必要がある
           @current_stock_array << count
  	#ループを抜ける
  		else
  			break
  		end
  	end
  	@current_stock_array.reject{|e|e ==0}
  	@cart_product = CartProduct.new
  end
end
