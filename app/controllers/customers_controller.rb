class CustomersController < ApplicationController
	before_action :authenticate_customer!
  	before_action :correct_user

  	def correct_user
      @customer = Customer.find(params[:id])
      redirect_to root_path unless @customer == current_customer
  	end

	def show
	  @customer = current_customer
	end

	def edit
	  @customer = current_customer
	end

	def leave
	  @customer = current_customer
	end

	def update
	  @customer = current_customer
	  if params[:leave]
	  	if @customer.email == quit_params[:email] && @customer.valid_password?(quit_params[:password])
	  		@customer.update(active:false)
	  		redirect_to root_path
	  	else
	  		render :leave
	  	end
	  else
	  	if @customer.update(customer_params)
	  		redirect_to customer_path(@customer)
	  	else
	  		render :edit
	  	end
	  end
	end

	private
  	def customer_params
    	params.require(:customer).permit(:password, :password_confirmation, :email, :last_name, :first_name, :last_name_read, :first_name_read, :phone_number, :postal_code, :address, )
  	end
  	def quit_params
    	params.require(:customer).permit(:email, :password)
  	end

end
