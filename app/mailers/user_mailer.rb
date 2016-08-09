class UserMailer < ApplicationMailer

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
  end

  def admin_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Approve New Member")
  end

end
