class V1::CommentsController < ApplicationController
  before_action :get_bounty

  def index
    @comments = @bounty.comments.all
    render json: @comments
  end

  def create
    @comment = @bounty.comments.build(comment_params)

    if @comment.save
      render json: {
        comment: @comment
      }, status: :created
    else
      render json: {
        error: @comment.errors.full_messages.first
      }, status: :bad_request
    end
  end

  def update
    @comment = @bounty.comment.find(params[:id])

    if @comment.update(comment_params)
      render json: {
        comment: @comment
      }, status: :ok
    else
      render json: {
        error: @comment.errors.full_messages.first
      }, status: :bad_request
    end
  end

  def destroy
    @comment = @bounty.comment.find(params[:id])
    @comment.destroy

    render json: {
      notice: "Successfully deleted the Comment"
    }, status: :ok
  end

  private
    def get_bounty
      @bounty = Bounty.find(params[:bounty_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
