class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    user_path(resource) # ログインした直後は、ユーザーの詳細ページに遷移
  end
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
