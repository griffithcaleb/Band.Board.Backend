Rails.application.routes.draw do

 # auth routs
 post '/login', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'
 get '/profile', to: 'users#profile'
 resources :users
 resources :posts


 get "/test", to: "test_post#index"
 get "/test/:id", to: "test_post#show"
 post "/test", to: "test_post#create"
 delete "/test/:id", to: "test_post#delete"
 put '/test/:id', to: "test_post#update"





end
