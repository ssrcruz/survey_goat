class SendMailer < ApplicationMailer
  def invitation(address)
    @address = address
    mail(to: address, subject: 'Welcome to My Awesome Site')
  end
end
