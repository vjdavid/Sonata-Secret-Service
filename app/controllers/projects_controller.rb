class ProjectsController < ApplicationController
  before_action :find_agent
  before_action :find_project, except: [:index, :create]

  def index
    @projects = @agent.projects
    render json: @projects
  end

  def show
    render json: @project
  end

  def create
    @project = @agent.projects.create(params_project)
    if @project.save
      render json: @project, status: 200
    else
      render json: @project.errors
    end
  end

  def update
    if @project.update(params_project)
      render json: @project, status: 200
    else
      render json: @project.errors
    end
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private
  def find_agent
    @agent = Agent.find(params[:agent_id])
  end

  def find_project
    @project = @agent.projects.find(params[:id])
  end

  def params_project
    params.require(:project).permit(:name, :description)
  end
end
