class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    unless is_admin?
      if current_user.is_completed
        profile_path(current_user)

      else
        register_profile_path(current_user)
      end
    else
        profiles_path
    end
    
  end

  def after_sign_up_path_for(resource)
    register_profile_path(current_user)
  end

  def is_admin?
    if current_user.admin?
      return true
    else
      return false
    end
  end

  def is_admin
    unless is_admin?
      flash[:error] = "Can not access that page"
      redirect_to profile_path(current_user)
    end
  end

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name,  :gender,  :profile_for]
  end

   
end
