class UsersController < ApplicationController



  def edit
  end

  def update

  end

  # def create
  #   User.create(:name, :email)
  # end

  private
  params.require(:user).permit

end
