class AmenitiesController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		@amenities = Amenity.all
	end

	def new
		@amenity = Amenity.new
	end

	def create
		@amenity = Amenity.new(amenity_params)
		if @amenity.save
			redirect_to amenities_path
		else
			render action: "new"
		end
	end

	def show
		@amenity = Amenity.find(params[:id])
	end

	def edit
		@amenity = Amenity.find(params[:id])
	end

	def update
		@amenity = Amenity.find(params[:id])
		if @amenity.update_attributes(amenity_params)
			redirect_to amenity_path(@amenity.id), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@amenity = Amenity.find(params[:id])
		@amenity.destroy
		redirect_to amenity_path
	end

	private

	def set_amenity
      @amenity = Amenity.find(params[:id])
    end

    def amenity_params
      params.require(:amenity).permit(:name, :description)
    end

end