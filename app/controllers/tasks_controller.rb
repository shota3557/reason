class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.new
  end

  def create
    @task= current_user.tasks.build(task_params) 
    if @task.save
      redirect_to new_cause_path(task_id: @task.id), notice: '登録完了しました'
    else
      render :new
    end
  end

  def index
    @tasks = Task.all
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update
      redirect_to tasks_path
    else
      render :edit  
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :picture, :image_cache)
  end
end

