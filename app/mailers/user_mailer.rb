class UserMailer < ApplicationMailer
  default from: Rails.application.secrets.from_email
 
  def session_email(email, user, url)
    @user = user
    @url = url
    mail(to: email, subject: "Session: #{user.session_str}")
  end
end