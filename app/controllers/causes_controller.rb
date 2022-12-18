class CausesController < ApplicationController
  before_action :cause_correct_user, only: [:edit, :update, :destroy, :show, :create]

  def index
    @first_cause = Cause.where(task_id: params[:task_id]).first
    @task = Task.find(params[:task_id])
    @cause = @task.causes.build
  end

  def show
    @task = Task.find(params[:task_id])
    @cause = @task.causes.build
    @causes = Cause.where(task_id: params[:task_id])
  end

  def new
    task = Task.find(params[:task_id])
    @cause = task.causes.build
    @cause.solutions.build
  end

  def edit
    @cause = Cause.find(params[:id])
    @task = Task.find(params[:task_id])
  end

  def create
    @cause = Cause.new(cause_params)
    @cause.task_id = params[:cause][:task_id]
    if @cause.save
      redirect_to task_cause_path(@cause.task, @cause), notice: "登録した"
    else
      render :new
    end
  end

  def update
    @cause = Cause.find(params[:id])
    if @cause.update(cause_params)
      redirect_to task_cause_path(@cause.task, @cause), notice: '編集した'
    else
      redirect_to edit_task_cause_path(@cause.task, @cause), notice: '未入力はできません'
    end
  end

  def destroy
    @cause = Cause.find(params[:id])
    @cause.destroy
    redirect_to task_cause_path(@cause.task, @cause), notice: '削除した'
  end

  private
  def cause_params
    params.require(:cause).permit(:task_id, :content, :picture, :movie, :done, solutions_attributes: [:id, :content, :picture, :movie, :done, :_destroy])
  end

  def cause_correct_user
    task = Task.find(params[:task_id])
    task.causes.build
    unless task.user == current_user
      redirect_to task_causes_path, notice: "あなたのタスクではありません" unless @user == current_user 
    end
  end
end
