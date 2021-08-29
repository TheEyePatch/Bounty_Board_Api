class BountyHunter < User
  validates :username, presence: true
  validates :password_confirmation, presence: true
end