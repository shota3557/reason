class CausesController < ApplicationController

  def index
    @causes = Cause.all
  end

  def show
    @cause = Cause.find(params[:id])
  end

  def new
    @cause = Cause.new
    @cause.task_id = params[:task_id]
  end

  def edit
    @cause = Cause.find(params[:id])
  end

  def create
    @cause = Cause.new(cause_params)
    @cause.task_id = params[:cause][:task_id]
    if @cause.save
      redirect_to causes_path, notice: "登録した"
    else
      render :new
    end
  end

  def update
    @cause = Cause.find(params[:id])
    if @cause.update(cause_params)
      redirect_to @cause, notice: '編集した'
    else
      render :edit
    end
  end

  def destroy
    @cause = Cause.find(params[:id])
    @cause.destroy
    redirect_to causes_url, notice: 'Cause was successfully destroyed.'
  end

  private
  def cause_params
    params.require(:cause).permit(:task_id, :content, :picture, :movie, :done)
  end
end
