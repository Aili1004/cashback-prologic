class PrologicController < ApplicationController

  def contact_prologic
    ContactMailer.contact_prologic(ENV['PROLOGIC_EMAIL'], params[:name], params[:email], params[:message]).deliver_later
    redirect_to '/'
  end
end
