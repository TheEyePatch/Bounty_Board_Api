class BountyHunter < User
  validates :username, presence: true
  validates :password_confirmation, presence: true

  has_many :appointments
#   has_many :projects, through: :bounties
  has_many :bounties, through: :appointments
  after_create :new_sign_up_mailer

  def new_sign_up_mailer
    byebug
    AdminMailer.new_user_waiting_for_approval(self).deliver 
    UserMailer.welcome_send(self).deliver
  end
end