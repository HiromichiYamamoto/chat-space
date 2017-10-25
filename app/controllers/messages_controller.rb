class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = @group.messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージを投稿しました'
    else
      redirect_to group_messages_path, alert: 'メッセージを入力してください'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
