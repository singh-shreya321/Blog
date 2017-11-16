module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :profile, :name, :password) }
    
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit({ roles: [] }, :email, :profile, :name, :current_password) }
  end

end

DeviseController.send :include, DevisePermittedParameters