class Amenity < ActiveRecord::Base

	#has_many :join_table
	#has_many :associated_table, through: :join_table

	has_many :amenity_rooms
	has_many :rooms, through: :amenity_rooms

end
