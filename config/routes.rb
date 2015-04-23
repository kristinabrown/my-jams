Rails.application.routes.draw do
  resources :songs
  root 'users#new'
  resources :users
  
  namespace :admin do 
    resources :tags
  end
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
