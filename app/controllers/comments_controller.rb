class CommentsController < ApplicationController
  before_action :load_chapter, :require_login, only: :create

  def create
    @comment = @chapter.comments.build comment_params
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = t "commented"
      redirect_to comic_chapter_url @chapter.comic, @chapter
    else
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
end
