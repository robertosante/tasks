class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user_save
      render json: { message: 'User was created' }, status: :created
    else
      render json: { errors: user.erorrs.full_message }, status: :bad_request
    end
  end

    private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

end
