class Manager::CustomersController < ApplicationController

	before_action :login_required

    def login_required
        redirect_to new_manager_session_path unless current_manager
    end

	def index
		@q = Customer.ransack(params[:q])
		@customers = @q.result(distict: true).page(params[:page]).per(10)
	end

	def show
		@customer = Customer.find(params[:id])
		@orders = @customer.orders
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		@customer.update(customer_params)
		redirect_to manager_customer_path(@customer)
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy
		redirect_to manager_customers_path
	end

	private
	def customer_params
		params.require(:customer).permit(:password, :password_confirmation, :email, :last_name, :first_name, :last_name_read, :first_name_read, :phone_number, :postal_code, :address,
    		registration_addresses_attributes: [:id, :name,:postal_code, :phone_number, :address, :customer_id, :_destroy])
    end

end