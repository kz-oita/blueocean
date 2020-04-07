class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    Profile.create(profile_params)
    binding.pry
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

  private
  def profile_params
    params.require(:profile).permit(:image, :text, :diver_lank, :dive_number).merge(user_id: current_user.id)
  end
end
