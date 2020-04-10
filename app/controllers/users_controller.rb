class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(4)
    @post = @user.posts.count
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user)
  end

  # def following
  #   @user = User.find(params[:id])
  #   @users = @user.followings
  #   render 'show_follow'
  # end

  # def followers
  #   @user = User.find(params[:id])
  #   @users = @user.followers
  #   render 'show_follower'
  # end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :text, :diver_lank, :dive_number)
  end
end