class TasksController < ApplicationController
respond_to :html, :js

  def index
    authorize Task
    @tasks = current_user.tasks.hide_completed
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = current_user.tasks.new(task_params)
    authorize @task

    if @task.save
      redirect_to tasks_path, notice: "Todo created!"
    else
      flash[:error] = "Error creating todo. Please try again."
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
  end

  def update
    @task = current_user.tasks.find(params[:id])
    authorize @task

    if @task.update_attributes(task_params)
      flash[:notice] = "Todo completed!"
    else
      flash[:error] = "There was an error updating the todo."
    end

    respond_with(@task) do |format|
      format.html { redirect_to tasks_path }
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    authorize @task

    if @task.destroy
      flash[:notice] = "Todo was deleted successfully."
    else
      flash[:error] = "There was an error deleting the todo."
    end

    respond_with(@task) do |format|
      format.html { redirect_to tasks_path }
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
