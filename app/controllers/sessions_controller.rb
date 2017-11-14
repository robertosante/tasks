class SessionsController < ApplicationController

  def authenticate_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      auth_token = JWToken.encode({user_id: user.id})
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: { errors: ['Invalid Credentials'] }, status: 400
    end
  end

  private

    def payload(user)
      return nil unless user and user.id
      {
        auth_token: JWToken.encode({user_id: user.id}),
        user: {id: user.id, email: user.email}
      }
    end

end

