class TasksController < ApplicationController
respond_to :html, :js

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "Todo created!"
    else
      flash[:error] = "Error creating todo. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update_attributes(task_params)
    else
      redirect_to tasks_path
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:notice] = "Todo was deleted successfully."
      redirect_to tasks_path
    else
      flash[:error] = "There was an error deleting the todo."
      redirect_to tasks_path
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
