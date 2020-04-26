class PostsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(20)
    @users = User.order("created_at DESC").page(params[:page]).first(4)
    @tags = Post.tag_counts_on(:tags).order('count DESC')
  end

  def new
    @post = Post.new
    @post.images.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
      flash[:success] = "投稿完了"
    else
      render :new
      flash[:danger] = "投稿失敗"
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.includes(:user)
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private
  def post_params
    params.require(:post).permit(:date, :title, :text, :tag_list, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
