class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :update, :destroy]

  # GET /agents
  # GET /agents.json
  def index
    @agents = Agent.all

    render json: @agents
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
    render json: @agent
  end

  # POST /agents
  # POST /agents.json
  def create
    @agent = Agent.new(agent_params)

    if @agent.save
      render json: @agent, status: :created, location: @agent
    else
      render json: @agent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update
    @agent = Agent.find(params[:id])

    if @agent.update(agent_params)
      head :no_content
    else
      render json: @agent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent.destroy

    head :no_content
  end

  private

    def set_agent
      @agent = Agent.find(params[:id])
    end

    def agent_params
      params.require(:agent).permit(:name, :token)
    end
end
