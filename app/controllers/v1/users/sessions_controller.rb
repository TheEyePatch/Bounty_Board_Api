# frozen_string_literal: true

module V1
  module Users
    class SessionsController < Devise::SessionsController
      before_action :user_sign_in_params, only: :create
      before_action :load_user, only: :create
      before_action :valid_token, only: :destroy
      skip_before_action :verify_signed_out_user, only: :destroy

      def create
        if @user.valid_password?(user_sign_in_params[:password])
          sign_in :bounty_hunter, @user
          render json: {
            messages: 'Signed in Successfully',
            is_success: true,
            data: {
              user: @user
            }
          }, status: :ok
        else
          render json: {
            messages: 'Invalid Email or Password',
            is_success: false,
            data: {}
          }, status: :unprocessable_entity
        end
      end

      def destroy
        sign_out @user
        @user.generate_token
        render json: {
          messages: 'Signed Out Successfully',
          is_success: true,
          data: {
            user: @user
          }
        }, status: :ok
      end

      private

      def load_user
        @user = User.find_for_database_authentication(email: user_sign_in_params[:email])
        return @user if @user
      end

      def user_sign_in_params
        params.require(:bounty_hunter).permit(:email, :password)
      end

      def valid_token
        @user = User.find_by(authentication_token: request.headers['Authorization'])
        @user || render(json: {
                          messages: 'Invalid Token',
                          is_success: false,
                          data: {}
                        }, status: :not_acceptable)
      end
    end
  end
end
