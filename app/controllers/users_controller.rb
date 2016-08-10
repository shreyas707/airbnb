class UsersController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render action: "new"
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_path(@user.id), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to user_path
	end

	private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
