Rails.application.routes.draw do
  resources :songs
  root 'songs#index'
  resources :users
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end