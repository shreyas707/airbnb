class Room < ActiveRecord::Base

	belongs_to :user
	belongs_to :city
	belongs_to :room_type

	has_many :bookings
	has_many :been_heres
	has_many :notifications
	
	has_many :amenity_rooms
	has_many :amenities, through: :amenity_rooms

end 