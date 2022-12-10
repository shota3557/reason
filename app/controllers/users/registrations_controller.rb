class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]
  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
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
