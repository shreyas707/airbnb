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
		@room = Room.find(params[:id])
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

	private

    def room_params
      params[:room].permit(:name, :description, :price, :rules, :minimum_days, :city_id, :room_type_id, amenity_ids: [])
    end

end
