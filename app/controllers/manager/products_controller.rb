class Manager::ProductsController < ApplicationController


	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.price*1.1
		@product.save
	end

	def index
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end



private
	def product_params
		params.require(:product).permit(:title, :image, :artist_id, :record_rabel_id, :category_id, :format, :sales_date, :price, :status)
	end
end
