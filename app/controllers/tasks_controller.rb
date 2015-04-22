class TasksController < ApplicationController
  before_action :find_project
  before_action :find_task, except: [:index, :create]

  def index
    @task = @project.tasks
    render json: @task
  end

  def show
    render json: @task
  end

  def create
    @task = @project.tasks.create(task_params)
    if @task.save
     render json: @task, status: 200
    else
      render json: @task.errors
    end
  end

  def update
   if @task.update(task_params)
     render json: @task, status: 200
   else
     render json: @task.errors
   end
  end

  def destroy
   @task.destroy
   head :no_content
  end

  private
  def task_params
    params.permit(:name, :description)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end

end
