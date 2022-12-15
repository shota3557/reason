class TasksController < ApplicationController

  def new
    @task = Task.new
    @cause = @task.causes.build
  end

  def index
    @tasks = Task.all
  end

  def create
    @task= current_user.tasks.build(task_params)     
    if @task.save
      redirect_to task_causes_path(@task), notice: '登録完了しました'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "編集しました"
    else
      render :edit  
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "削除しました"
  end

  private
  def task_params
    params.require(:task).permit(:name, :picture, :image_cache, :done, causes_attributes: [:id, :content, :picture, :movie, :task_id, :_destroy, solutions_attributes: [:id, :content, :picture, :movie, :_destroy]])
  end
end

