class RegisterMailer < ApplicationMailer
  def register_cashback contact_email, name, email
    mail(from: email, to: contact_email, subject: "#{name} Registered")
  end
end
