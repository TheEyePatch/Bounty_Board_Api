class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def generate_token
    auth_token = User.generate_unique_secure_token
    update(authentication_token: auth_token)
  end
  scope :pending_users, lambda {
    where(approved: false)
  }
end
