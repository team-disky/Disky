class CartProductsController < ApplicationController
	before_action :authenticate_customer!

	def create
        #前ページから渡ってきた自分の紐づいた商品IDを探す
       cart_product = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
   		if cart_product
        #もしあればcountカラムの数値を更新する（既存の値＋パラメータで渡ってきた数値）
          cart_product.update(count: cart_product.count + params[:cart_product][:count].to_i)
		  redirect_to cart_products_path
		else
		  cart_product = CartProduct.new(cart_product_params)
          cart_product.save
		  redirect_to cart_products_path
		end
	end

	def index
		#ログインユーザーのIDを持っているcart_productsをすべて持ってくる
		@customer = current_customer
		@cart_products = @customer.cart_products
	end

	def update
		#数量を変更するcart_productを持ってくる
		cart_product = CartProduct.find(params[:id])
		#数量が入ったカラムを変更する
		if cart_product.update(cart_product_count_params)
		#カートページに戻る
		redirect_to cart_products_path

	    else
	    @customer = current_customer
		@cart_products = @customer.cart_products
	    render :index
	    end
	end

	def destroy
		#削除するcart_productを持ってくる
		cart_product = CartProduct.find(params[:id])
		#該当のcart_productを削除する
		cart_product.destroy
		#カートに戻る
		redirect_to cart_products_path
	end

	private

	def cart_product_params
		params.require(:cart_product).permit(:product_id,:customer_id,:count)
	end

	def cart_product_count_params
		params.require(:cart_product).permit(:count)
	end
end

