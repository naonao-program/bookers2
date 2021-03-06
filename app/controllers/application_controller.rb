class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protected
    def configure_permitted_parameters
        if resource_class == User
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email,:name])
            devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
    end
  end
end
