Rails.application.routes.draw do

  resources :restaurants

  root controller: 'application', action: 'index'

end
