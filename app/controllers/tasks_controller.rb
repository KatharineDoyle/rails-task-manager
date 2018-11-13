class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save!
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path(@task)
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id].to_i)
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
