Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 # auth routs
 post '/login', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'
 get '/profile', to: 'users#profile'
 resources :users
 resources :posts




end
