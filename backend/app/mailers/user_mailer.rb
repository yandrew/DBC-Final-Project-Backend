class UserMailer < ActionMailer::Base
  default from: "notifications.sellme@gmail.com"

  def registration_confirmation(user)
  	mail(:to => user.email, :subject => "Registered", :from => "notifications.sellme.gmail.com")
  end

  def invalid_offer(user)
  	mail(:to => user.email, :subject => "Registered", :from => "notifications.sellme.gmail.com")
  end

  def offer_accepted(user)
  end
end
