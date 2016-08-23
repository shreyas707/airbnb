class RegistrationsController < Devise::RegistrationsController
=begin
	def create
		build_resource(sign_up_params)

		resource.save
		yield resource if block_given?
		if resource.persisted?
			if resource.active_for_authentication?
				set_flash_message! :notice, :signed_up
				#sign_up(resource_name, resource)
				respond_with resource, location: after_sign_up_path_for(resource)
			else
				set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
				expire_data_after_sign_in!
				respond_with resource, location: after_inactive_sign_up_path_for(resource)
			end
		else
			clean_up_passwords resource
			set_minimum_password_length
			respond_with resource
		end
	end
=end
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role, :mobile_number)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :mobile_number)
  end

  #This enables admin to create a new user - error saying user already signed in doesn't pop up.
  #prepend_before_filter :require_no_authentication#, :only => []
  #prepend_before_filter :authenticate_scope!

end