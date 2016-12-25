class RelationsController < ApplicationController
  
  def create
    
    @following_relations = current_user.following_relations.new
    @following_relations.following = User.find_by_id(params[:user_id])
    @following_relations.save
  end

  def destroy
    following_relations =  current_user.following_relations.find_by(:following_id => params[:user_id])
    following_relations.delete
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_params
      params.fetch(:relation, {})
    end
end
