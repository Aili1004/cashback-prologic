class PrologicController < ApplicationController
  layout "pro_logic"

  def home
  end

  def contact_prologic
    ContactMailer.contact_prologic(params[:name], params[:email], params[:message]).deliver
    redirect_to prologic_path
  end
end
