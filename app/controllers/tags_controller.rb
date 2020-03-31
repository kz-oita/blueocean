class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:id])
    @posts = Post.tagged_with(@tag.name).order("created_at DESC").page(params[:page]).per(4)
  end
end