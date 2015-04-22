class AgentsController < ApplicationController
  before_action :find_agent, only: [:show, :update, :destroy]
  before_action :find_current_proyect
  
  def index
    @agents = Agent.all
    render json: @agents
  end

  def create
    @agent = Agent.create(agent_params)

    if @agent.save
      render json: @agent, status: 200
    else
      render json: @agent, status: 404
    end
  end

  def show
    render json: @agent
  end

  def update
    if @agent.update(agent_params)
      render json: @agent, status: 200
    else
      render json: @agent, status: 404
    end
  end

  def destroy
    @agent.destroy
    head :no_content
  end

  private

  def agent_params
    params.require(:agent).permit(:name, :email)
  end

  def find_agent
    @agent = Agent.find(params[:id])
  end

  def find_current_proyect
    @agent = Agent.find(params[:current_project_id])
  end
end
