# frozen_string_literal: true

class ApplicationController < ActionController::API
  devise_group :user, contains: [:bounty_hunter, :admin]
  include AuthenticateUser
end
