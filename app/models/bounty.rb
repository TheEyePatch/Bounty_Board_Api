# frozen_string_literal: true

class Bounty < ApplicationRecord
  has_many :appointments
  has_many :bounty_hunters, through: :appointments
end
