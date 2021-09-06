class ApplicationController < ActionController::API
  devise_group :user, contains: [:bounty_hunter, :admin]
  include AuthenticateUser
  include SerializableResource
end
