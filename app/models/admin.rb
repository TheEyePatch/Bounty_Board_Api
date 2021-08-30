class Admin < User
  validates :username, presence: true
end