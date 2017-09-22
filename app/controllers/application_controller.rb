class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  protect_from_forgery prepend: true

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :name, :lastname)
    end
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
  end
end
