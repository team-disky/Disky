class CartProduct < ApplicationRecord
	belongs_to :customer
	belongs_to :product

	validates :count, presence: true

	def stock_check
		product.stock -  count
	end
end
