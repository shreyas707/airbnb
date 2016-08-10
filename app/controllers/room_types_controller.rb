class RoomTypesController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		@room_types = RoomType.all
	end

	def new
		@room_type = RoomType.new
	end

	def create
		@room_type = RoomType.new(room_type_params)
		if @room_type.save
			redirect_to room_types_path
		else
			render action: "new"
		end
	end

	def show
		@room_type = RoomType.find(params[:id])
	end

	def edit
		@room_type = RoomType.find(params[:id])
	end

	def update
		@room_type = RoomType.find(params[:id])
		if @room_type.update_attributes(room_type_params)
			redirect_to room_type_path(@room_type.id), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@room_type = RoomType.find(params[:id])
		@room_type.destroy
		redirect_to room_type_path
	end

	private

    def room_type_params
      params.require(:room_type).permit(:name)
    end

end