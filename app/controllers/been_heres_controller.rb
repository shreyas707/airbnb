class BeenHeresController < ApplicationController

	def create
		@been_here = BeenHere.new(been_here_params)

		if @been_here.save
			redirect_to rooms_path
		else
			render action: "new"
		end
	end

	private
	def been_here_params
      params[:been_here].permit(:user_id, :room_id, :date)
	end

end
