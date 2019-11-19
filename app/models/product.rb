class Product < ApplicationRecord
	has_many :arrivals
	has_many :purchased_products
	has_many :cart_products
	has_many :discs
	belongs_to :artist
	belongs_to :record_label
	belongs_to :category

	attachment :image

	accepts_nested_attributes_for :discs

	enum status:{販売中:0,販売停止中:1}
	enum format:{シングル:0,アルバム:1,マキシシングル:2,複数アルバム:3,ミニアルバム:4}

	def total_arrival
		Arrival.where(product_id: id).sum(:count)
	end

	def total_purchased_product
		PurchasedProduct.where(product_id: id).sum(:count)
	end

	def stock
		total_arrival - total_purchased_product
	end
end