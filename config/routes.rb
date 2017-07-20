Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cashbacks#home'

  get '/au', to: 'cashbacks#home'
  get '/nz', to: 'cashbacks#home'
end
