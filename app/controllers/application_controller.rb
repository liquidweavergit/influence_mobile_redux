# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_is_admin

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username birthdate gender])
  end

  def set_is_admin
    @is_admin = current_user&.admin
  end

  def redirect_non_admins
    redirect_to offers_path unless @is_admin
  end
end
