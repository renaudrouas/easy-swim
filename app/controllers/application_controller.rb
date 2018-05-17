class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   # For additional fields in app/views/devise/registrations/new.html.erb
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :phone_number, :photo, :email, :password, :password_confirmation, :remember_me])

  #   # For additional in app/views/devise/registrations/edit.html.erb
  #   # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  # end

  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :address, :phone_number, :photo, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_edit, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
