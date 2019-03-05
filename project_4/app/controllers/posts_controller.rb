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

  def edit
    render json: Post.update(params["id"],params["post"])
  end

  def delete
      Post.find(params["id"]).destroy
      render json:{message: "deleted"}
  end

  private
  def post_params
    params.require(:post).permit(:title, :info, :view, :author,
    :number_of_likes)
  end


end
