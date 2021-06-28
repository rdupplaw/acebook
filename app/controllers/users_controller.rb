class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
    else
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
