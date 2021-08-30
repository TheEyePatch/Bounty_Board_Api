# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :bounty_hunter, class_name: 'User', foreign_key: 'user_id'
  belongs_to :bounty, class_name: 'Bounty', foreign_key: 'bounty_id'
end
