Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cashbacks#home'

  get '/au', to: 'cashbacks#home'
  get '/nz', to: 'cashbacks#home'

  get '/cashback_promotions', to: 'cashbacks#promotions'
  get '/cashback_payments_and_distribution', to: 'cashbacks#cashback_payments_and_distribution'
  get '/loyalty_programs', to: 'cashbacks#loyalty_programs'
  get '/competitions_sweepstakes_and_games', to: 'cashbacks#competitions_sweepstakes_and_games'
  get '/promotion_management', to: 'cashbacks#promotion_management'
  get '/gift_with_purchase', to: 'cashbacks#gift_with_purchase'
  get '/eftpos_cash_back_cards', to: 'cashbacks#eftpos_cash_back_cards'
  get '/about_us', to: 'cashbacks#about_us'
  get '/contact', to: 'cashbacks#contact'
  post '/contact_cashback', to: 'cashbacks#contact_cashback'

  get '/prologic', to: 'prologic#home'
  post '/contact_prologic', to: 'prologic#contact_prologic'
end
