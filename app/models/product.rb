class Product < ApplicationRecord
	has_many :arrivals
	has_many :purchased_products
	has_many :cart_products
	has_many :discs
	belongs_to :artist
	belongs_to :record_label
	belongs_to :category

	attachment :image
end
