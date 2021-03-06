class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    if current_user.list
      current_user.list
    else
      new_list_path
    end
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
