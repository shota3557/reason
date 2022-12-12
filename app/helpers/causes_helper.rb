module CausesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      task_causes_path
    elsif action_name == 'edit'
      task_cause_path method: :patch
    end
  end
end
