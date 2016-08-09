class AmenityRoom < ActiveRecord::Base

	belongs_to :amenity
	belongs_to :room

end
