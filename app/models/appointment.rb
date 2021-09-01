class Appointment < ApplicationRecord
    belongs_to :bounty
    belongs_to :bounty_hunter
end
