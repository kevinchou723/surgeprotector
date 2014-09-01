Rails.application.routes.draw do

  get 'price_queries/index', to: 'price_results#index'

  root to: 'price_results#index'

  get 'price_queries/:id', to: 'price_results#show'

  get '/about', to: 'site#about'

  get 'api_calls/index'

end