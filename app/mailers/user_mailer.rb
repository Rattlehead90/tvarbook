class UserMailer < ApplicationMailer
  default from: ENV['email']

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to tvářbook')
  end
end
