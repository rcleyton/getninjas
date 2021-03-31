class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.professional? 
      dashboard_path
    elsif current_user.customer? 
      if current_user.profile.present?
        dashboard_path
      else
        new_profile_path
      end
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end