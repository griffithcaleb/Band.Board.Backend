Rails.application.routes.draw do

 # auth routs
 post '/login', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'
 get '/profile', to: 'users#profile'
 put "/users/:id", to: 'users#edit'
 resources :users

 get '/posts', to: 'posts#index'
 get '/posts/:id', to: 'posts#show'
 post '/posts', to: 'posts#create'
 put '/posts/:id', to: 'posts#edit'
 delete '/posts/:id', to: 'posts#delete'


 get "/messages", to: "messages#index"
 post '/messages', to: 'messages#create'  





end
