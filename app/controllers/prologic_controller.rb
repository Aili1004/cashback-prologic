class PrologicController < ApplicationController
  layout "pro_logic"

  def home
  end

  def contact_prologic
    ContactMailer.contact_prologic(params[:name], params[:email], params[:message]).deliver_later
    redirect_to ENV['PROLOGIC_URL']
  end
end
