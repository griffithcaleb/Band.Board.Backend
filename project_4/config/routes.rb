Rails.application.routes.draw do

 # auth routs
 post '/login', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'
 get '/profile', to: 'users#profile'
 resources :users
 resources :posts


 get "/test", to: "testpost#index"
 get "/test/:id", to: "testpost#show"
 post "/test", to: "testpost#create"
 delete "/test/:id", to: "testpost#delete"
 put '/test/:id', to: "testpost#update"





end
