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

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
