class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:followed_id])
    following =current_user.follow!(@user)
    if following.save
      redirect_to @user
    else
      redirect_to @user
    end
    # respond_to do |format|  
    #   format.html { redirect_to @user }  
    #   format.js  
    # end  
  end

  def destroy
    @user = User.find(params[:relationship][:followed_id])
    following =current_user.unfollow!(@user)
    if following.destroy
      redirect_to @user
    else
      redirect_to @user
    end
    # respond_to do |format|  
    #   format.html { redirect_to @user }  
    #   format.js  
    # end 
  end
end
