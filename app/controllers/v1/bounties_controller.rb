class V1::BountiesController < ApplicationController
  before_action :authenticate_user, only: [:show, :index, :update, :dibs, :create]
  before_action :authenticate_admin, only: [:delete, :approve, :approve_finished_bounty]
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

    if @bounty.save  && @current_user.type == "Admin"
      @bounty.update(approved: true)
      render json: {
        notice: "Successfully posted the Bounty",
        bounty: @bounty
      }, status: :created
    elsif @bounty.save
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


  # Both the approve and approve_finished_bounty are for Admin only.
  def approve
    @bounty = Bounty.find(params[:id])
    if @bounty.update(approved: bounty_params[:approved]) && @bounty.save
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

  def approve_finished_bounty
    bounty = Bounty.find(params[:id])
    if bounty.update(status: bounty_params[:status]) && bounty.save
      render json: {
        notice: 'Bounty is finished',
        bounty: bounty,
      }, status: :ok
    else
      render json: {
        error: bounty.errors.full_messages.first
      },status: :bad_request
    end

  end
  
  def update
    @bounty = Bounty.find(params[:id])

    if @bounty.update(bounty_params)
      render json: {
        notice: "Successfully Approved Bounty",
        bounty: @bounty
      }, status: :ok
    else
      render json: {
        error: @bounty.errors.full_messages.first
      }, status: :bad_request
    end
  end

  def dibs
    @bounty = Bounty.find(params[:id])

    if @bounty.update(status: bounty_params[:status]) && bounty_params[:status] == "in_progress"
      Appointment.create(bounty_id: params[:id], bounty_hunter_id: @current_user.id)

      render json: {
        notice: "Successfully updated the Bounty status; Appointment created",
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
      params.require(:bounty).permit(:title, :description, :link, :reward_points, :urgency, :status, :deadline, :date_finished, :project_id, :max_participants,  :approved)
    end

    def get_project
      @project = Project.find(bounty_params[:project_id])
      return @project if @project
    end
end
