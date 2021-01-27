class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  include Response

  protect_from_forgery with: :exception
  respond_to :json
end
