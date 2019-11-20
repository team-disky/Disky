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
	end

	def confirm
		#注文確認画面を表示させる
	end

	def create
		#入力された注文情報を保存する
	end
end
