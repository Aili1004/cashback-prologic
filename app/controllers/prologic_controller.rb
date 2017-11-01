class PrologicController < ApplicationController
  layout "pro_logic"

  def home
  end

  def contact_prologic
    ContactMailer.contact_prologic(ENV['PROLOGIC_EMAIL'], params[:name], params[:email], params[:message]).deliver_later
    redirect_to '/'
  end
end
