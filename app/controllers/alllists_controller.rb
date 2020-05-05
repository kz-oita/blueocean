class AlllistsController < ApplicationController
  def index
    @users = User.order("created_at DESC")
    @post = Post.includes(:user).order("created_at DESC")
    @tag = Post.tag_counts_on(:tags).order('count DESC')
  end
end
