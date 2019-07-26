class CommentsController < ApplicationController
  before_action :load_chapter, only: :create
  before_action :require_login, only: %i(create destroy)
  before_action :correct_comment, only: :destroy

  def create
    @comment = @chapter.comments.build comment_params
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html{redirect_to comic_chapter_url @chapter.comic, @chapter}
        format.js
      end
    else
      render "chapters/show"
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html{redirect_to request.referrer || @chapter}
        format.js
      end
    else
      flash[:danger] = t ".delete_failed"
      render "chapters/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def load_chapter
    @chapter = Chapter.find_by id: params[:chapter_id]

    return if @chapter
    flash[:success] = t "common.chapter_not_found"
    redirect_to root_path
  end

  def correct_comment
    @chapter = Chapter.find_by id: params[:chapter_id]
    @comment = current_user.comments.find_by id: params[:id]
    return if @comment
    flash[:danger] = t ".not_found"
    redirect_to @chapter
  end
end
