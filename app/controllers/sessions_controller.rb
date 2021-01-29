class SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(sign_in_params[:email])

    if user&.valid_password?(sign_in_params[:password])
      @current_user = user
    else
      error = { errors: { login: ['is invalid'] } }
      json_response(error, :unauthorized)
    end
  end
end
