class Disc < ApplicationRecord
	belongs_to :product
    has_many :songs

    accepts_nested_attributes_for :songs, allow_destroy: true

    validates :number, :songs, presence: true
end
