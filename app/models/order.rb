class Order < ApplicationRecord
	belongs_to :customer
	has_many :purchased_products
end
