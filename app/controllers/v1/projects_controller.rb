class V1::ProjectsController < ApplicationController
    # before_action :authenticate_user, only: [:show, :index, :create, :update]
    # before_action :authenticate_admin, only: [:create, :update]
    
    def index
        @projects = Project.all
        render json: @projects
    end

    def show
        @project = Project.find(params[:id])
        render json: @project
    end
    def create
        @project = Project.new(project_params)
        if @project.save
            render json: {
                notice: "Successfully Created a Project",
                project: @project
            },status: :created
        else
            render json: {
                error: @project.errors.full_messages
            }, status: :bad_request
        end
    end
    def update
        @project = Project.find(params[:id])
        if @project.update(project_params)
                render json: {
                notice: "Successfully updated a Project",
                project: @project
            },status: :ok
        else
              render json: {
                error: @project.errors.full_messages
            }, status: :bad_request
        end

    end
    def destroy
        @project = Project.find(params[:id])
        @project.destroy
    end
    private
    def project_params
        params.require(:project).permit(:title, :description)
    end
  
end
