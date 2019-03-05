class TestPostController < ApplicationController
  # index route
  def index
    render json: Test_post.all
  end

  #show route
  def show
    render json: Test_post.find(params["id"])
  end

  # create route
  def create
    render json: Test_post.create(params["post"])
  end

  # delete route
  def delete
    render json: Test_post.delete(params["id"])
  end

  # update route
  def update
    render json: Test_post.update(params["id"], params["post"])
  end
end
