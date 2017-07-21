class ContactMailer < ApplicationMailer
  def contact_cashback name, email, message
    @message = message
    mail(from: email, to: "aili@givvtechnologies.com", subject: name, body: @message)
  end
end
