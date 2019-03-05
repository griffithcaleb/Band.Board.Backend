class UsersController < ApiController
  before_action :require_login, except: [:create]

  def create
      user = User.create!(user_params)
      render json: {token: user.auth_token}
  end

  def profile
    user = User.find_by_auth_token!(request.headers[:token])
    user_posts = user.posts
    render json: {user: {username: user.username,
       email: user.email, name: user.name,instrument: user.instrument,
     bio: user.bio, locations: user.locations },
     posts: user_posts}
  end

  def edit
      render json: User.update(params["id"],params["user"])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :name)
  end
end
