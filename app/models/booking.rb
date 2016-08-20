class Booking < ActiveRecord::Base

	validate :check_date

	belongs_to :user
	belongs_to :room

	private
	def check_date
		bookings = Booking.where('room_id = ?', self.room_id)
		bookings.each do |booking|
			if(self.start_date == booking.start_date || 
				self.end_date == booking.end_date || 
				(booking.start_date..booking.end_date).include?(self.start_date) || 
				(booking.start_date..booking.end_date).include?(self.end_date) || 
				(self.end_date - self.start_date).to_i < booking.room.minimum_days.to_i )
					errors.add(:start_date, "This date is already taken.")
			end
		end
	end

end