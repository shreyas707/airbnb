class BeenHere < ActiveRecord::Base

	belongs_to :user
	belongs_to :room

	def check_been_here
		if (self.user_id < self.project.start_date || self.due_date > project.end_date)
			errors.add(:due_date, "is invalid.")
		end
	end

end
