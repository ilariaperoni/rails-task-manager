class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # needed to initiate the form_for helper
  end

  def create
    puts task_params
    task = Task.new(task_params)
    task.save
    redirect_to task_path(task)
  end

  def edit
    @task = @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @pet.update(task_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path, status: :see_other #because we delited the pet,
    # we need to redirect to the index
  end

  private

  def task_params
    # :task is the model name
    params.require(:task).permit(:title, :details, :completed)
  end
end
