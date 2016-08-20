class BookingsController < ApplicationController

	def index
		@bookings = current_user.is_admin? ? Booking.all : current_user.bookings 
	end

	def create
		@booking = Booking.new(booking_params)

		if @booking.save
			redirect_to rooms_path
		else
			redirect_to :back, notice: "These dates are taken. Please select a different date."
		end
	end

	def show
		@room = Room.find(params[:id])
		begin
			if current_user.is_admin?
				@booking = Booking.find(params[:id])
			else
				@booking = current_user.bookings.find(params[:id])
			end
		rescue ActiveRecord::RecordNotFound
			redirect_to bookings_path, notice: "Record not found."
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		redirect_to rooms_path
	end

	def my_room_bookings 		
		@room = Room.find(params[:room_id])
		@bookings = Booking.where('room_id = ?', params[:room_id]) 
	end

	private
	def booking_params
      params[:booking].permit(:user_id, :room_id, :start_date, :end_date)
	end

end