class V1::Users::RegistrationsController <  DeviseController
  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]
  before_action :ensure_params_exist, only: :create
  before_action :authenticate_user, only: :update
  
  def create
    user = BountyHunter.new(user_params)
    if user.valid? && user.save
      render json: {
        messages: 'Signed Up Successfully',
        is_success: true,
        data: {
          user: user
        },
      }, status: :ok
    else
      render json: {
        messages: user.errors.full_messages.first,
        is_success: false,
        data: {},
      }, status: :unprocessable_entity
    end
  end

  def update
    @current_user.update(user_params)
    if @current_user.save
      render json: {
        messages: 'Updated Current User Successfully',
        data: @current_user,
      }, status: :accepted
    else
      render json: {
        messages: @current_user.errors.full_messages.first,
        data: {}
      }, status: :not_acceptable
    end
  end


      def create
        user = BountyHunter.new(user_params)
        if user.valid? && user.save
          render json: {
            messages: 'Signed Up Successfully',
            is_success: true,
            data: {
              user: user
            }
          }, status: :ok
        else
          render json: {
            messages: user.errors.full_messages.first,
            is_success: false,
            data: {}
          }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end

      def ensure_params_exist
        return if params[:user].present?

        render json: {
          messages: 'Missing params',
          is_success: false,
          data: {}
        }, status: :bad_request
      end
    end
  end
end
