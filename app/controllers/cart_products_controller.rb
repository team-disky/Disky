class CartProductsController < ApplicationController
	def create
		#Form forの値の受け渡し先を作成する
		cart_product = CartProduct.new(cart_product_params)
		if cart_product.save
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
		cart_product.update(cart_product_count_params)
		#カートページに戻る
		redirect_to cart_products_path
	end

	def destroy
		#削除するcart_productを持ってくる
		cart_product = CartProduct.find(params[:id])
		#該当のcart_productを削除する
		cart_product.destroy
		#カートに戻る
		redirect_to cart_products_path
	end

	def select_adress
	end

	private

	def cart_product_params
		params.require(:cart_product).permit(:product_id,:customer_id,:count)
	end

	def cart_product_count_params
		params.require(:cart_product).permit(:count)
	end
end

