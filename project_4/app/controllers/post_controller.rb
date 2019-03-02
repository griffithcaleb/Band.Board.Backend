class PostController < ApplicationController
  # index route
  def index
    render json: Post.all
  end

  #show route
  def show
    render json: Post.find(params["id"])
  end

  # create route
  def create
    render json: Post.create(params["post"])
  end

  # delete route
  def delete
    render json: Post.delete(params["id"])
  end

  # update route
  def update
    render json: Post.update(params["id"], params["post"])
  end
end
