class Song < ApplicationRecord
	belongs_to :disc

	validates :number, :title, :recording_time_seconds, presence: true
end
