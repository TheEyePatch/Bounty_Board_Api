class Comment < ApplicationRecord
  belongs_to :bounty_hunter
  belongs_to :bounty
end
