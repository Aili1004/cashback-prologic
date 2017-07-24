class ContactMailer < ApplicationMailer
  def contact_cashback name, email, message
    @message = message
    mail(from: email, to: "aili@givvtechnologies.com", subject: "CashBack - #{name}", body: @message)
  end

  def contact_prologic name, email, message
    @message = message
    mail(from: email, to: "aili@givvtechnologies.com", subject: "ProLogic - #{name}", body: @message)
  end
end
