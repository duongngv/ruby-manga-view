class RelationshipsController < ApplicationController
  before_action :require_login
  before_action :load_comic, only: :create
  before_action :load_following_comic, only: :destroy

  def create
    if follow?
      current_user.follow @comic
      respond_to do |format|
        format.html{redirect_to @comic}
        format.js{render "follow.js.erb"}
      end
    elsif like?
      current_user.like @comic
      respond_to do |format|
        format.html{redirect_to @comic}
        format.js{render "like.js.erb"}
      end
    end
  end

  def destroy
    if follow?
      current_user.unfollow @comic
      respond_to do |format|
        format.html{redirect_to @comic}
        format.js{render "unfollow.js.erb"}
      end
    elsif like?
      current_user.unlike @comic
      respond_to do |format|
        format.html{redirect_to @comic}
        format.js{render "unlike.js.erb"}
      end
    end
  end

  private

  def follow?
    params[:follow].eql? Settings.follow
  end

  def like?
    params[:like].eql? Settings.like
  end

  def load_following_comic
    @comic = Relationship.find_by(id: params[:id]).comic

    return if @comic
    flash[:warning] = t ".not_found"
    redirect_to root_path
  end

  def load_comic
    @comic = Comic.find_by(id: params[:comic_id])

    return if @comic
    flash[:warning] = t ".not_found"
    redirect_to root_path
  end
end
