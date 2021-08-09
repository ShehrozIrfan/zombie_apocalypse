Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup', to: 'survivals#new'
  get '/profile', to: 'survivals#show'

  root 'app_pages#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :survivals
end