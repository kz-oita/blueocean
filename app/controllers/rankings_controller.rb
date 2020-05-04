class RankingsController < ApplicationController


  def index
    @post_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(4).pluck(:post_id))
    @user_ranks = User.find(Post.group(:user_id).order('count(user_id) desc').limit(4).pluck(:user_id))
  end
end
