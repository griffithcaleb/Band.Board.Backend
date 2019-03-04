class PostsController < ApiController
  before_action :require_login, except:[:index, :show]

  def index
      posts = Post.all
      render json:{posts: posts}
  end

  def show
      post = Post.find(params[:id])
      render json: {post: post}
  end

  def create
    post = Post.new(post_params)
    post.user = current_user

    if post.save
      render json:{
        message: "ok",
        post: post
      }
    else
      render json:{message: "Couldnt post message"}
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :info)
  end


end
