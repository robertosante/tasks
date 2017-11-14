class ApplicationController < ActionController::API
 
  require 'json_web_token'

  protected

    def authenticate
      if !token_info || !JWToken.valid_load(token_info.first)
        return invalid_user
      end

      current_user?
      invalid_user unless @current_user
    end

    def invalid_user
      render json: {error: 'Invalid Request'}, status: :unauthorized
    end

  private

    def token_info
      auth_header = request.headers['Authorization']
      token = auth_header.split(' ').last
      JWToken.decode(token)
    rescue
      nil
    end

    def current_user?
      @current_user = User.find_by(id: token_info[0]['user_id'])
    end

end
