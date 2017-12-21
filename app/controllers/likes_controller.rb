class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create #いいねする
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'いいねしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy #いいね消す
    @like = Like.find_by(micropost_id: params[:micropost_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_url)
  end
  
  def like_microposts
    @user = User.find(params[:id])
    @like_microposts = @user.like_microposts.page(params[:page])
  end
end
