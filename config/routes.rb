Rails.application.routes.draw do


  get 'session/new'
  root to: "pages#home"

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  resources :users
  resources :loans
  resources :games
  resources :categories

end
