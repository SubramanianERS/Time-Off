Rails.application.routes.draw do
  get 'sessions/new'
  get '/holidays', to: 'holidays#all'
  get '/signUp' , to: 'users#signUp'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/calendar', to: 'calendar#show'
  get '/createEvent', to: 'calendar#createEvent'
  root 'users#signUp'
  resources :users
end
