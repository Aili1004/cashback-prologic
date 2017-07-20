Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cashbacks#home'

  # remove the following two routes after buying domains
  get '/au', to: 'cashbacks#home'
  get '/nz', to: 'cashbacks#home'

  get '/cashback_promotions', to: 'cashbacks#promotions'
  get '/cashback_payments_and_distribution', to: 'cashbacks#cashback_payments_and_distribution'
end
