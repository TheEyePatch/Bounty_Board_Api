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

  def authenticate_admin
    return if authenticate_user.type == 'Admin'
    render json:{
      messages: 'User is not an Admin',
        data: {}
      }, status: :not_acceptable
  end
 
end

