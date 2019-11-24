class Manager::ArrivalsController < ApplicationController

	 before_action :login_required

    def login_required
        redirect_to new_manager_session_path unless current_manager
    end


	def create
		@arrival = Arrival.new(arrival_params)
		if @arrival.save
		redirect_to manager_product_path(@arrival.product_id)
		else
			render 'products/add_quantity'
		end
	end


	def index
		@arrivals = Arrival.order(id: "DESC").page(params[:page]).per(10)
	end


private
	def arrival_params
		params.require(:arrival).permit(:product_id, :date, :count)
	end
end
