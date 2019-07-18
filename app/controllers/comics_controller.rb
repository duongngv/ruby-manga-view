class ComicsController < ApplicationController
  before_action :load_comic, only: :show

  def index
    @comics = Comic.name_alphabet.page(params[:page])
                   .per Settings.comic.per_page
  end

  def show
    @category = Category.find_by id: @comic.category_id
    @chapters = @comic.chapters.recent_upload.page(params[:page])
                      .per Settings.chapter.per_page
    @trendding = Comic.popular.page.per Settings.comic.trendding_right
  end

  private

  def load_comic
    @comic = Comic.find_by id: params[:id]
    return if @comic

    flash[:danger] = t "common.comic_not_found"
    redirect_to root_url
  end
end
