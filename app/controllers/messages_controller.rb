class MessagesController < ApplicationController


  def index
    @groups = current_user.groups if user_signed_in?
  end

end
