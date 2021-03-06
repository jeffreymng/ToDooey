Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: 'users#show'
  resources :users, only: [:new, :create]
  resources :tasks, except: [:show]
end
