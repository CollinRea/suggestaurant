Rails.application.routes.draw do

  resources :restaurants
  resources :users, only: [:new, :create, :show, :edit]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', :via => :delete

  root controller: 'application', action: 'index'
end
