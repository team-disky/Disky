class Manager::ProductsController < ApplicationController


	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.price = (@product.price*1.1).round(0)
		if @product.save
		redirect_to manager_product_path(@product.id)
		else
			render :new
		end
	end

	def index
		@products = Product.page(params[:page]).per(10)
	end

	def show
		@product = Product.find(params[:id])
		@discs = @product.discs
	end

	def edit
		@product = Product.find(params[:id])
		@product.price = (@product.price/1.1).round(0)
	end

	def update
		@product = Product.find(params[:id])
		params[:product][:price] = (params[:product][:price].to_i*1.1).round(0).to_s
		if @product.update(product_params)
		flash[:notice] = "内容を編集しました。"
		redirect_to manager_product_path(@product.id)
		else
		render action: :edit
		end
	end

	def destroy
	end

	def add_quantity
		@product = Product.find(params[:id])
		@arrival = Arrival.new
	end



private
	def product_params
		params.require(:product).permit(:title, :image, :artist_id, :record_label_id, :category_id, :format, :sales_date, :price, :status,
			discs_attributes: [:id, :product_id, :number, songs_attributes: [:id, :disc_id, :title, :number, :recording_time_minutes, :recording_time_seconds]] )
	end
end
