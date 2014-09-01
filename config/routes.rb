Rails.application.routes.draw do

  get 'price_results/index'

  root to: 'price_results#index'

  get '/about', to: 'site#about'

  get 'api_calls/index'

end