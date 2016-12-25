class LikesController < ApplicationController
  before_action :require_login

  def create
    @like = current_user.likes.new
    @like.post = Post.find_by_id(params[:post_id])
    
    @like.save

    respond_to do |format|
      format.js 
    end
  end

  def destroy
    @like = Like.find_by_id(params[:id])
    @like.delete
    respond_to do |format|
      format.js 
    end
  end

  private
    def like_params
      params.fetch(:like, {})
    end
end
