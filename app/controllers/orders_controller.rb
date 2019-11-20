class OrdersController < ApplicationController
	def show
		#購入履歴詳細を表示する
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
		#入力されたものを持ってきていれる
		@order = Order.new(order_params)
		#保存が成功した場合、注文完了画面へ遷移させる
		if @order.save
		  redirect_to root_path
		end
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
