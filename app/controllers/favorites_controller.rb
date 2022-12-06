class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end
    
  def create
    favorite = current_user.favorites.create(task_id: params[:task_id])
    redirect_to tasks_path, notice: "登録した"
  end
  
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to tasks_path, notice: "解除した"
  end
end
