Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get "/users", to: "user#index"
 get "/users/:id", to: "user#show"
 post "/users", to: "user#create"
 delete "/users/:id", to: "user#delete"
 put '/users/:id', to: "user#update"
 get "/posts", to: "post#index"
 get "/posts/:id", to: "post#show"
 post "/posts", to: "post#create"
 delete "/posts/:id", to: "post#delete"
 put '/posts/:id', to: "post#update"




end
