class V1::Admins::AdminsController < ApplicationController
  before_action :authenticate_admin

  def index
    @admins = Admin.all
  end

  def create
    admin = Admin.new(new_admin_param)
    if admin.valid? && admin.save
      render json: {
        messages: 'Admin Created Successfully',
        is_success: true,
        data: {
          user: admin
        },
      }, status: :ok
    else 
      render json: {
        messages: admin.errors.full_messages.first,
        is_success: false,
        data: {},
      }, status: :unprocessable_entity
      
    end
  end

  private
  def new_admin_param
    params.require(:admin).permit(:username, :email, :password, :password_confirmation)
  end
end
