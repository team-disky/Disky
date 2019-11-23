class RegistrationAddress < ApplicationRecord
	belongs_to :customer

	def fullname
		last_name + full_name
	end

end
