class Bounty < ApplicationRecord
  has_many :appointments
  has_many :bounties, through: :appointments
end
