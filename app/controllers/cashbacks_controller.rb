class CashbacksController < ApplicationController
  layout "cashbacks"

  def home
  end

  def promotions
  end

  def cashback_payments_and_distribution
  end

  def loyalty_programs
  end

  def competitions_sweepstakes_and_games
  end

  def promotion_management
  end

  def gift_with_purchase
  end

  def eftpos_cash_back_cards
  end

  def about_us
  end

  def contact
  end

  def contact_cashback
    ContactMailer.contact_cashback(params[:name], params[:email], params[:message]).deliver_later
    redirect_to @web_url
  end
end
