module AuthenticateUser 

  def authenticate_user
    @current_user = User.find_by(authentication_token: request.headers["Authorization"])
    if @current_user
      return @current_user
    else
      render json: {
        messages: 'Cannot Find User',
        data: {}
      }, status: :unprocessable_entity
    end
  end
end