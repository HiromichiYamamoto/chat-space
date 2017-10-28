class UsersController < ApplicationController
   before_action :set_user, only: [:edit, :update]

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
       redirect_to :root
     else
       render 'edit'
     end
  end

  private

  def set_user
     @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
