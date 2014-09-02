Rails.application.routes.draw do

  # REMOVED TEST ROUTES RELATED TO PRICE RESULTS

  get '/api_calls/index'

  get '/about', to: 'site#about'

  get '/index', to: 'site#index'

  root to: 'site#index'

  post '/search', to: 'site#search'

  # 404 route -- update later to render 404 page?
  get '*path', to: 'site#index'

end