class ContactMailer < ApplicationMailer
  def contact_cashback contact_email, name, email, message
    @message = message
    mail(from: email, to: contact_email, subject: "CashBack - #{name}", body: @message)
  end

  def contact_prologic contact_email, name, email, message
    @message = message
    mail(from: email, to: contact_email, subject: "ProLogic - #{name}", body: @message)
  end
end
