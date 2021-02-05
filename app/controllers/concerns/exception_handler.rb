module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from JWT::ExpiredSignature do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from JWT::VerificationError do |e|
      json_response({ message: e.message }, :unauthorized)
    end

    rescue_from JWT::DecodeError do |e|
      json_response({ message: e.message }, :bad_request)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do |e|
      json_response({ message: e.message }, :bad_request)
    end
  end
end
