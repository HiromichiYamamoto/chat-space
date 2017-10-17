class MessagesController < ApplicationController


  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    if @message.save
      render template: "messages/index"
    else
      redirect_to :back, alert: 'メッセージを入力してください。'
    end
  end

  private
  def message_params
    params[:message].permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
