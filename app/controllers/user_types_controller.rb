class UserTypesController < ApplicationController

	#before_action :authenticate_user!

	def index
		@user_types = UserType.all
	end

	def new
		@user_type = UserType.new
	end

	def create
		@user_type = UserType.new(user_type_params)
		if @user_type.save
			redirect_to user_types_path
		else
			render action: "new"
		end
	end

	def show
		@user_type = UserType.find(params[:id])
	end

	def edit
		@user_type = UserType.find(params[:id])
	end

	def update
		@user_type = UserType.find(params[:id])
		if @user_type.update_attributes(user_type_params)
			redirect_to user_type_path(@user_type.id), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@user_type = UserType.find(params[:id])
		@user_type.destroy
		redirect_to user_type_path
	end

	private

    def user_type_params
      params.require(:user_type).permit(:name, :description)
    end

end
