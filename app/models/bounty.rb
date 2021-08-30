# frozen_string_literal: true

class Bounty < ApplicationRecord
  belongs_to :bounty_hunter, optional: true
  belongs_to :project
end
