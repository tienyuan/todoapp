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
      redirect_to tasks_path, notice: "Todo updated!"
    else
      redirect_to tasks_path, notice: "Error completing todo. Please try again."
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end

end
