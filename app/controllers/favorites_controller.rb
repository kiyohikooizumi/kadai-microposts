class FavoritesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorites.find_or_create_by(micropost: @micropost)
    flash[:success] = 'micropostをお気に入りにしました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @unfavorite = current_user.unfavorite(@micropost)
    flash[:success] = 'micropostをお気に入りから外しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def favorite_params
    params.require(:favorite).permit(:content)
  end
  
end
