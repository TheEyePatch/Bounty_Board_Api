class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :created_at, :updated_at, :approved, :verified_by
end
