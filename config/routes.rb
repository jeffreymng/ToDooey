Rails.application.routes.draw do
  root to: 'users#show'
  resources :users, only: [:new, :create]
end
