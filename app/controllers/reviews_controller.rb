class ReviewsController < ApplicationController

	def index
		@reviews = current_user.is_admin? ? Review.all : current_user.reviews 
	end

	def create
		@review = Review.new(review_params)
		if @review.save
			redirect_to :back
		else
			redirect_to :back
		end
	end

	def edit	
		#if @review.user_id == current_user.id
			@review = Review.find(params[:id])
		#end
	end

	def update
		@review = Review.find(params[:id])
		if @review.user_id == current_user.id
			if @review.update_attributes(room_params)
				redirect_to room_path(@room.id), notice: "Successfully updated"
			else
				render action: "edit"
			end
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to room_path(@room.id)
	end

	private
	def review_params
      params[:review].permit(:user_id, :room_id, :body, :rating)
	end

end