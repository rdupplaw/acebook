class InvitationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @invitations = Invitation.where(user_id: @user.id)
  end

  def create 
    @user = User.find(params[:user_id])
    @user.send_invitation(current_user)
    redirect_to user_path(@user), notice: "Friend request sent to #{@user.firstname} #{@user.lastname}"
  end

  def update 
    @user = User.find(params[:user_id])
    @friend = User.find(params[:id])
    @user.accept_invitation(@friend)
    redirect_to user_invitations_path, notice: "You are now friends with #{@friend.firstname} #{@friend.lastname}"
  end
end