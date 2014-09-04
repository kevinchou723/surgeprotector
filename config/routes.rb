Rails.application.routes.draw do

  get "/login", to: 'session#new'

  post "/login", to: 'session#create'

  delete "/logout", to: 'session#destroy'

  get "/logout" => "session#destroy"

  get '/api_calls/index'

  get '/about', to: 'site#about'

  get '/index', to: 'site#index'

  root to: 'site#index'

  post '/search', to: 'site#search'

  resources :users do
    resources :price_queries
  end

  get '/users/:user_id/places/new', to: 'price_queries#new', as: 'new_place'

  get '/users/:user_id/places/:id', to: 'price_queries#show', as: 'place'

  get '/signup', to: 'users#new'

  # 404 route -- update later to render 404 page?
  # get '*path', to: 'site#index'

end