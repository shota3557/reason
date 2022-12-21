class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
    @favorites = Favorite.all
  end
    
  def create
    favorite = current_user.favorites.create(task_id: params[:task_id])
    redirect_to tasks_path, notice: "お気に入り登録しました"
  end
  
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to tasks_path, notice: "お気に入り解除しました"
  end
end
