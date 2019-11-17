class Manager::ProductsController < ApplicationController


	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.price = @product.price*1.1
		if @product.save
		redirect_to manager_product_path(@product.id)
		else
			render :new
		end
	end

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
	end



private
	def product_params
		params.require(:product).permit(:title, :image, :artist_id, :record_label_id, :category_id, :format, :sales_date, :price, :status,
			discs_attributes: [:id, :product_id, :number, songs_attributes: [:id, :disc_id, :title, :number, :recording_time_minutes, :recording_time_seconds]] )
	end
end
