class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?, only: [:create]
 
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,
                                                       :encrypted_password,
                                                       :reset_password_token,
                                                       :role])

  end   
end
