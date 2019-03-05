class MessagesController < ApiController
  before_action :require_login

  def index
    user = User.find_by_auth_token!(request.headers[:token])
    user_message = user.messages.all
    render json: {messages: user_message}
  end

  def create
    message = Message.new(mes_params)

    if message.save
      render json:{message: "ok"}
    else
      render json:{message: "Couldnt post message"}
    end
  end

  private
  def mes_params
    params.require(:message).permit(:sent_name, :sent_user,
    :sent_id, :message, :user_id)
  end

end
