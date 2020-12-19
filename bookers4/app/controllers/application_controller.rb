class ApplicationController < ActionController::Base
  # --- Adds: name to devise ------
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Signin Singup Redirects
  def after_sign_in_path_for(resource)
    mypage_path(resource)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # Adds: name
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  #--------------------------------
end
