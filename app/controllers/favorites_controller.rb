class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user_post = Micropost.find(params[:micropost_id])
    current_user.like(user_post)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user_post = Micropost.find(params[:micropost_id])
    current_user.unlike(user_post)
    flash[:success] = 'お気に入りから削除しました。'
    redirect_back(fallback_location: root_path)
  end
end
