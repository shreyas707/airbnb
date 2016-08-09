class CitiesController < ApplicationController

	before_action :authenticate_user!

	def index
		@cities = City.all
	end

	def new
		@city = City.new
	end

	def create
		@city = City.new(city_params)
		if @city.save
			redirect_to cities_path
		else
			render action: "new"
		end
	end

	def show
		@city = City.find(params[:id])
	end

	def edit
		@city = City.find(params[:id])
	end

	def update
		@city = City.find(params[:id])
		if @city.update_attributes(city_params)
			redirect_to city_path(@city.id), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@city = City.find(params[:id])
		@city.destroy
		redirect_to cities_path
	end

	private

    def city_params
      params.require(:city).permit(:name)
    end

end
