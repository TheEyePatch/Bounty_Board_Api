class Admin < User
  acts_as_token_authenticatable
  validates :username, presence: true
  
  before_validation :set_approve_to_true, on: %i[create save]
  
  def set_approve_to_true
    self.approved =true
  end
end