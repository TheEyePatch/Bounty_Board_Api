class V1::BountiesController < ApplicationController
  before_action :authenticate_user, only: [:show, :index,:create, :update]
  before_action :authenticate_admin, only: [:create, :delete]
  before_action :get_project, only: :create

  def index
    @bounties = Bounty.all
    render json: @bounties
  end

  def show
    @bounty = Bounty.find(params[:id])
    render json: @bounty
  end

  def create
    @bounty = @project.bounties.build(bounty_params)

    if @bounty.save
      render json: {
        notice: "Successfully posted the Bounty",
        bounty: @bounty
      }, status: :created
    else
      render json: {
        error: @bounty.errors.full_messages.first
      }, status: :bad_request
    end
  end

  def update
    @bounty = Bounty.find(params[:id])

    if @bounty.update(bounty_params)
      render json: {
        notice: "Successfully updated the Bounty",
        bounty: @bounty
      }, status: :ok
    else
      render json: {
        error: @bounty.errors.full_messages.first
      }, status: :bad_request
    end
  end

  def destroy
    @bounty = Bounty.find(params[:id])
    @bounty.destroy

    render json: {
      notice: "Successfully deleted the Bounty"
    }, status: :ok
  end

  private
    def bounty_params
      params.require(:bounty).permit(:title, :description, :link, :reward_points, :urgency, :status, :deadline, :date_finished, :project_id)
    end

    def get_project
      @project = Project.find(bounty_params[:project_id])
      return @project if @project
    end
end