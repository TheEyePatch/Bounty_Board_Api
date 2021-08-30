# frozen_string_literal: true

module AuthenticateUser
  def authenticate_user
    @current_user = User.find_by(authentication_token: request.headers['Authorization'])
    @current_user || render(json: {
                              messages: 'Cannot Find User',
                              data: {}
                            }, status: :unprocessable_entity)
  end

  def authenticate_admin
    return if authenticate_user.type == 'Admin'
    render json:{
      messages: 'User is not an Admin',
        data: {}
      }, status: :not_acceptable
  end
 
end

