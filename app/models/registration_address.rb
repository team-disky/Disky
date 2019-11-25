class RegistrationAddress < ApplicationRecord
	belongs_to :customer
	validates :name, :phone_number, :postal_code, :address,  presence: true

end