class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task= current_user.tasks.build(task_params) 
    if @task.save
      redirect_to new_cause_path
    else
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :picture, :image_cache)
  end
end

