class UserMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
    mail to: user.email, subject: 'Welcome to RadMafiaDao Bounty Board', from: 'noreply@radgamingguide.com'
  end

  def approve_account(user)
    @user = user
    mail to: user.email, subject: 'Travel-zilla Approve account', from: 'noreply@radgamingguide.com'
  end

  def reject_account(user)
    @user = user
    mail to: user.email, subject: 'Travel-zilla Reject Account', from: 'noreply@radgamingguide.com'
  end
end
