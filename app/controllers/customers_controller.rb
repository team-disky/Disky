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

	def edit_password
	  @customer = current_customer
	end

	def leave
	  @customer = current_customer
	end

	def update
	  @customer = current_customer
	  if params[:leave]
	  	if @customer.email == quit_params[:email] && @customer.valid_password?(quit_params[:password])
	  		@customer.update(active: false)
	  		redirect_to root_path
	  	else
	  		flash.now[:error] = "・メールアドレスまたはパスワードに誤りがあります。"
	  		render :leave
	  	end
	  elsif params[:edit_pass]
	  	if @customer.valid_password?(password_params[:current_password])
	  		if password_params[:password] == password_params[:password_confirmation]
	  			if @customer.update(password: password_params[:password])
	  				@customer.update(password_confirmation: password_params[:password_confirmation])
	  				flash[:password_change] = "パスワードを変更しました。再度ログインしてください。"
	  				redirect_to new_customer_session_path
	  			else
	  				flash.now[:error] = "・パスワードは6文字以上で入力してください"
	  				render :edit_password
	  			end
	  		else
	  			flash.now[:error] = "・新パスワードと新規確認用パスワードが一致しません"
	  			render :edit_password
	  		end
	  	else
	  		flash.now[:error] = "・現在のパスワードが一致しません"
	  		render :edit_password
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
    	params.require(:customer).permit(:password, :password_confirmation, :email, :last_name, :first_name, :last_name_read, :first_name_read, :phone_number, :postal_code, :address,
    		registration_addresses_attributes: [:id, :name,:postal_code, :phone_number, :address, :customer_id, :_destroy])
  	end
  	def quit_params
    	params.require(:customer).permit(:email, :password)
  	end

  	def password_params
    	params.require(:customer).permit(:current_password, :password, :password_confirmation)
  	end

end
