class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    Profile.create(profile_params)
    redirect_to root_path
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    profile = Profile.find(params[:id])
    profile.update(post_params)
    redirect_to root_path
  end
end
