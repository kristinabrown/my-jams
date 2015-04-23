Rails.application.routes.draw do
  resources :songs
  root 'user#new'
  resources :user
  
  namespace :admin do 
    resources :tags
  end
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
