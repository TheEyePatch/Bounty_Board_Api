class BountyHunter < User
  validates :username, presence: true
  validates :password_confirmation, presence: true

  has_many :bounties
  has_many :projects, through: :bounties
end