class LocalGovernment::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
     local_government_root_path
  end

  def after_sign_out_path_for(resource)
     root_path
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
