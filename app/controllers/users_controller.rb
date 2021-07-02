# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def show
    @user = User.find(params[:id])
    @invitations = Invitation.where(user_id: @user.id)
    @friend = Invitation.where(user_id: @user.id).pluck(:friend_id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to posts_url
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attribute(:bio, params[:user][:bio])
    @user.update_attribute(:age, params[:user][:age])
    @user.update_attribute(:home_town, params[:user][:home_town])
    @user.update_attribute(:education, params[:user][:education])
    @user.update_attribute(:workplace, params[:user][:workplace])
    @user.update_attribute(:relationship_status, params[:user][:relationship_status])
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :profile_picture)
  end
end
