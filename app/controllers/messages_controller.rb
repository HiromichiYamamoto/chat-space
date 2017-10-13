class MessagesController < ApplicationController

  def index
    @message = User.find(params[:id])
  end

end
