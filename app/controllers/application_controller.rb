class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  def stored_location_for(resource)
    nil
  end
  
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
  
  protected

   def configure_permitted_parameters
   # devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :initials])
   end
end
