class Room < ActiveRecord::Base

	has_attached_file :image, styles: {large: "600x600#", medium: "300x300", small: "150x150#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	belongs_to :user
	belongs_to :city
	belongs_to :room_type

	has_many :bookings
	has_many :reviews
	
	has_many :amenity_rooms
	has_many :amenities, through: :amenity_rooms

end 