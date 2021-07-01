# frozen_string_literal: true

class SessionsController < ApplicationController
  
  
  skip_before_action :require_login, only: %i[new create]
  
  def new
    require_login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
      redirect_to posts_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def require_login
    unless logged_in?
      flash.now[:error] = "You must be logged in to access this section"
    end
  end


end
