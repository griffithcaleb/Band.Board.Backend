class UserController < ApplicationController
  # index route
  def index
    render json: User.all
  end

  #show route
  def show
    render json: User.find(params["id"])
  end

  # create route
  def create
    render json: User.create(params["user"])
  end

  # delete route
  def delete
    render json: User.delete(params["id"])
  end

  # update route
  def update
    render json: User.update(params["id"], params["user"])
  end
end
