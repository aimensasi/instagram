class CommentsController < ApplicationController
  before_action :require_login

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = Post.find_by_id(params[:post_id])
    
    @comment.save
    
    respond_to do |format|
      format.js 
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.fetch(:comment, {}).permit(:text)
    end
end
