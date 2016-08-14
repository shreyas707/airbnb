class BookingsController < ApplicationController

	def create
		@booking = Booking.new(booking_params)

		if @booking.save
			redirect_to rooms_path
		else
			render action: "new"
		end
	end

	private
	def booking_params
      params[:booking].permit(:user_id, :room_id, :start_date, :end_date)
	end

end