class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Response
  include ExceptionHandler

  protect_from_forgery with: :exception
  respond_to :json
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user
  skip_before_action :verify_authenticity_token

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def authenticate_user
    return unless request.headers['Authorization'].present?

    authenticate_or_request_with_http_token do |token|
      jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

      @current_user_id = jwt_payload['id']
    end
  end

  def authenticate_user!(_options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end
end
