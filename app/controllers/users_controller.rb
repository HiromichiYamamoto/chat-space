class UsersController < ApplicationController

  def edit
  end

  def update

  end

  private
  params.require(:user).permit

end
