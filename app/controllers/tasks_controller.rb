class TasksController < ApplicationController
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

  private

  def task_params
    params.require(:task).permit(:description)
  end

end
