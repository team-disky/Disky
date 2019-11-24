class Manager::OrdersController < ApplicationController

	before_action :login_required

    def login_required
        redirect_to new_manager_session_path unless current_manager
    end

	def index
		@orders = Order.all
		@orders = Order.page(params[:page]).per(10)
	end

	def show
		@order = Order.find(params[:id])
		@purchased_products = @order.purchased_products
	end

	def update
		order = Order.find(params[:id])
		order.update(order_params)
		redirect_to manager_order_path(order)
	end

	private
	def order_params
		params.require(:order).permit(:status)
	end
end

