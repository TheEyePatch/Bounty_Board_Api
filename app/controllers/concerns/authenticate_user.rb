# frozen_string_literal: true

module AuthenticateUser
  def authenticate_user
    @current_user = User.find_by(authentication_token: request.headers['Authorization'])
    @current_user || render(json: {
                              messages: 'Cannot Find User',
                              data: {}
                            }, status: :unprocessable_entity)
  end
end
