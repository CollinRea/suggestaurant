Rails.application.routes.draw do

  resources :restaurants, except: :destroy
  resources :ratings, only: [:new, :create, :edit, :update]
  resources :users, only: [:new, :create, :show, :edit]


  get '/users' => redirect('/users/new')

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', :via => :delete

  root controller: 'welcome', action: 'index'
end
