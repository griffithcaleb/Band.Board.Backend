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


 get "/test", to: "test_post#index"
 get "/test/:id", to: "test_post#show"
 post "/test", to: "test_post#create"
 delete "/test/:id", to: "test_post#delete"
 put '/test/:id', to: "test_post#update"





end
