class Bounty < ApplicationRecord
  belongs_to :bounty_hunter, optional: true
  belongs_to :project

  has_many :appointments
  has_many :bounty_hunters, through: :appointments
end
