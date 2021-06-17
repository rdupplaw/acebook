class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new 
  end

  def create
    @user = User.create(user_params)
    redirect_to posts_url
  end
  
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end
end
