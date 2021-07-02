class InvitationsController < ApplicationController
  def create 
    @user = User.find(params[:user_id])
    @user.send_invitation(current_user)
    redirect_to user_path(@user), notice: "Friend request sent to #{@user.firstname} #{@user.lastname}"
  end

  def update 
    @user = User.find(params[:user_id])
    @friend = User.find(params[:id])
    @friend.accept_invitation(@user)
    redirect_to user_path(@user), notice: "You are now friends with #{@user.firstname} #{@user.lastname}"
  end
end