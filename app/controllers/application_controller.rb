# frozen_string_literal: true

class ApplicationController < ActionController::API
  devise_group :user, contains: [:bounty_hunter]
  include AuthenticateUser
end
