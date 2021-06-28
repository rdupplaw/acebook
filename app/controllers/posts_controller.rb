# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = posts_ordered_by_descending_date
    @user = current_user if logged_in?
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def like
    post = Post.find(params[:id])
    post.likes += 1
    post.save!
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end

  def posts_ordered_by_descending_date
    Post.order(created_at: :desc)
  end
end
