# frozen_string_literal: true

class LocalGovernment::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def after_sign_up_path_for(resource)
    local_government_root_path
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:phone_number, :population])
  end

end