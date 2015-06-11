Rails.application.routes.draw do

  root 'locations#index'

  resources :locations

  get '/locations/search' => 'locations#show'
end
