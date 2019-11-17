class Manager::CustomersController < ApplicationController

	def index
		@q = Customer.ransack(params[:q])
		@customers = Customer.all
		@customers = Customer.page(params[:page]).per(10)
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name, :email, :phone_number)
    end

end