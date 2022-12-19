class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:index]
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "ユーザを削除しました"
  end

  private
  def admin_user
    unless current_user.admin?
      redirect_to tasks_path, notice: "管理者以外アクセスできません" 
    end
  end  
end
