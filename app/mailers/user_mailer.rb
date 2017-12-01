class UserMailer < ApplicationMailer

  def notify_user(user)
    @user = user
    mail(to: @user.email, subject: "Welcome To My Blog")
  end
end
