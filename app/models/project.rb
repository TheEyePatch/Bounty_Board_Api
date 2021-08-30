class Project < ApplicationRecord
  has_many :bounties
  has_many :bounty_hunters, through: :bounties
end
