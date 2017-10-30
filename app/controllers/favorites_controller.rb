class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def index
    @favorite = Favorite.all.page(params[:page])
    @micropost = Micropost.all.page(params[:page])
    @user = User.all.page(params[:page])
  end

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'micropostをお気に入りにしました。'
    #redirect_to user
     redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'micropostのお気に入りを解除しました。'
    #redirect_to user
    redirect_to root_url
  
  end
end
