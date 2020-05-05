class UsersController < ApplicationController

  def show
    if user_signed_in?
      @user = User.find(params[:id])
      @posts = @user.posts.order("created_at DESC")
      @post = @user.posts.count
    else
      redirect_to new_user_registration_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :text, :diver_lank, :dive_number)
  end
end