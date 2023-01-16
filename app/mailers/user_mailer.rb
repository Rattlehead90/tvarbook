class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, from: 'tvářbook', subject: 'Welcome to tvářbook')
  end
end
