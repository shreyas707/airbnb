class RoomsController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		if params[:room_type_id]
			@rooms = Room.where('room_type_id = ?', params[:room_type_id])
		elsif params[:city_id]
			@rooms = Room.where('city_id = ?', params[:city_id])
		elsif params[:price]
			@rooms = @price = Room.where('price >= ? AND price <= ?', params[:min_price], params[:max_price])
		else
			@rooms = Room.all
		end
		@room_types = RoomType.all
		@cities = City.all
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)
		@room.user_id = current_user.id
		if @room.save
			redirect_to rooms_path
		else
			render action: "new"
		end
	end

	def show
		begin
			@room = Room.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to rooms_path, notice: "Record not found."
		end
		
		#this is for view count of each room of all users
		@room.increment!(:view_count) if current_user.id != @room.user.id
		
		#this is for view count of each room of each user
		@view = ViewCount.where('user_id = ? AND room_id = ?', current_user.id, @room.id)
		if !(@view.empty?)
			@view.each do |view|
				view.increment!(:view_count) if current_user.id != @room.user.id
			end
		elsif current_user.id != @room.user.id
			@view_count = ViewCount.new 
			@view_count.user_id = current_user.id
			@view_count.room_id = @room.id 
			@view_count.increment!(:view_count) if current_user.id != @room.user.id
			@view_count.save
		end

		#for booking
		@booking = Booking.new
		@booking.user_id = current_user.id
		@booking.room_id = @room

		#for reviews
		@reviews = Review.all
		@new_review = Review.all.where('user_id = ?'), current_user.id
		@review = Review.new
		@review.user_id = current_user.id
		@booking.room_id = @room

	end

	def edit	
		if @room.user_id == current_user.id
			@room = Room.find(params[:id])
		end
	end

	def update
		@room = Room.find(params[:id])
		if @room.user_id == current_user.id
			if @room.update_attributes(room_params)
				redirect_to room_path(@room.id), notice: "Successfully updated"
			else
				render action: "edit"
			end
		end
	end

	def destroy
		@room = Room.find(params[:id])
		@room.destroy
		redirect_to room_path
	end

	def by_price_range
		@rooms = Room.where('price >= ? AND price <= ?', params[:min_price], params[:max_price])
	end

	def my_rooms
		@rooms = current_user.rooms
	end

	def user_visits
		@views = ViewCount.all
	end

	private

    def room_params
      params[:room].permit(:image, :name, :description, :price, :rules, :minimum_days, :city_id, :address, :latitude, :longitude, :room_type_id, amenity_ids: [])
    end

end
