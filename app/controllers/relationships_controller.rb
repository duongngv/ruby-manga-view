class RelationshipsController < ApplicationController
  before_action :require_login

  def create
    return unless @comic = Comic.find_by(id: params[:comic_id])

    return unless params[:follow] == Settings.follow
    current_user.follow @comic
    respond_to do |format|
      format.html{redirect_to @comic}
      format.js
    end
  end

  def destroy
    return unless @comic = Relationship.find_by(id: params[:id]).comic

    return unless params[:follow] == Settings.follow
    current_user.unfollow @comic
    respond_to do |format|
      format.html{redirect_to @comic}
      format.js
    end
  end
end
