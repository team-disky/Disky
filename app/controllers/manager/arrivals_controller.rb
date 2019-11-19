class Manager::ArrivalsController < ApplicationController

	def create
		@arrival = Arrival.new(arrival_params)
		if @arrival.save
		redirect_to manager_product_path(@arrival.product_id)
		else
			render 'products/add_quantity'
		end
	end


	def index
		@arrivals = Arrival.all
	end


private
	def arrival_params
		params.require(:arrival).permit(:product_id, :date, :count)
	end
end
