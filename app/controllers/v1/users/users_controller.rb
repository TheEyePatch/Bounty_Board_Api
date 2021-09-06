class V1::Users::UsersController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin

  def pending_users
    @users = User.pending_users
    user_serializer = parse_json @users
    render json: {
          is_success: true,
          data: {
            user: user_serializer
          }
        }, status: :ok
  end
  def approve_user 
    @user = User.find(params[:id])
    @user.approved = true;
    @user.verified_by = @current_user.id
    @user.generate_token
    if @user.save(:validate => false)
      UserMailer.approve_account(@user).deliver
        render json: {
                notice: "Successfully Approve #{@user.username}",
            },status: :ok
    else
       render json: {
                error: @user.errors.full_messages
            }, status: :bad_request
    end
  end
end
