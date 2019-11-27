class CartProduct < ApplicationRecord
	belongs_to :customer
	belongs_to :product

	validates :count, presence: true
end
