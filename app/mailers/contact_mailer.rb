class ContactMailer < ApplicationMailer
  def contact_cashback name, email, message
    @message = message
    mail(from: email, to: @contact_email, subject: "CashBack - #{name}", body: @message)
  end

  def contact_prologic name, email, message
    @message = message
    mail(from: email, to: ENV['PROLOGIC_EMAIL'], subject: "ProLogic - #{name}", body: @message)
  end
end
