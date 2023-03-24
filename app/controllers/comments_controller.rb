class CommentsController < ApplicationController
  def create
    comment = initialize_comment
    comment.save!
    flash[:success] = 'Comment created'
    redirect_to project_path(permitted_params[:project_id])
  rescue ActiveRecord::RecordInvalid => e
    flash[:notice] = "Something went wrong => #{e.message}"
    redirect_to projects_path
  end

  private

  def initialize_comment
    comment = Comment.new
    comment.text = permitted_params[:text]
    comment.project_id = permitted_params[:project_id].to_i
    comment.user = current_user
    comment
  end

  def permitted_params
    params.require(:comment).permit(:text, :project_id)
  end
end
