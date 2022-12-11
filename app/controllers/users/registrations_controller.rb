class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]
  before_action :ensure_admin_user, only: %i[update destroy]

  def ensure_normal_user
    if params[:user][:email].downcase == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end

  def ensure_admin_user
    if params[:user][:email].downcase == 'admin_guest@guest.com'
      redirect_to root_path, alert: 'ゲスト管理者は削除できません'
    end
  end

  protected
  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end

  def after_sign_in_path_for(resource)
    tasks_path
  end
end
