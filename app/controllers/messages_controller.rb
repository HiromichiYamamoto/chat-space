class MessagesController < ApplicationController


  def index
    @groups = current_user.groups if user_signed_in?
  end

  def new

  end

  def create

  end

end
