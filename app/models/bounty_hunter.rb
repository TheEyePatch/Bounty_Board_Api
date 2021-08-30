# frozen_string_literal: true

class BountyHunter < User
  validates :username, presence: true
  validates :password_confirmation, presence: true

  has_many :appointments
  has_many :bounties, through: :appointments
end
