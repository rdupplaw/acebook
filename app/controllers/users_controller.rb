class UsersController < ApplicationController
  def new 
  end
  
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end
end
