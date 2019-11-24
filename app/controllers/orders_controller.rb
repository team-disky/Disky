class OrdersController < ApplicationController
	before_action :authenticate_customer!

	def show
		#購入履歴詳細を表示する
		before_action :correct_user

  			def correct_user
      			@order = Order.find(params[:id])
      			redirect_to root_path unless @order.customer_id == current_customer.id
  			end
		@order = Order.find(params[:id])
		@customer = Customer.find(@order.customer_id)
	end

	def select_address
		#お届け先住所の選択画面を表示する

		#現在のユーザーを定義する
		@customer = current_customer
		#空のインスタンスを渡す
		@order = Order.new
	end

	def select_payment
		#決済方法を選択する
		#住所選択からのパロメーターを渡す
		@order = Order.new(select_address_params)
	end

	def confirm
		#注文確認画面を表示させる
		#パロメータに入っている情報を渡す
		@order = Order.new(post_params)
		#ユーザーを現在ログインしているユーザーと定義する
		@customer = current_customer
		#現在ログインしているユーザーに紐づいているcart_productを定義する
		@cart_products = @customer.cart_products
	end

	def create
		#オーダー情報を保存、カート情報をpurchased_productsに保存
		#入力されたものを持ってきていれる
		@order = Order.new(order_params)
		#保存が成功した場合、注文完了画面へ遷移させる
		if @order.save
			current_customer.cart_products.each do |cart_product|
				purchased_product = PurchasedProduct.new
				purchased_product.order_id = @order.id
				purchased_product.product_id = cart_product.product_id
				purchased_product.count = cart_product.count
				purchased_product.price = cart_product.product.price
				purchased_product.save
				cart_product.destroy
		    end
		  redirect_to complete_path(@order.id)
		end
	end

	def complete
		#注文完了画面を表示させる
		#URLから注文番号を持ってくる
		@order = Order.find(params[:id])
	end

	private
	def select_address_params
		params.require(:order).permit(:destination_name, :destination_phone_number, :postal_code, :destination_address)
	end

	def post_params
		params.require(:order).permit(:destination_name, :destination_phone_number, :postal_code, :destination_address, :payment_method)
	end

	def order_params
		params.require(:order).permit(:customer_id, :total_amount, :subtotal_amount, :contractee_name, :contractee_phone_number, :postage, :destination_name, :destination_phone_number, :postal_code, :destination_address, :payment_method, 
			purchased_products_attributes:[:id, :order_id, :product_id, :price, :count])
	end
end
