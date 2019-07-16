class Admin::ChaptersController < AdminController
  before_action :load_chapter, only: :show
  before_action :load_comic, only: %i(new create)

  def index
    @chapters = @comic.chapters.sort_by_name.page(params[:page])
                      .per Settings.chapter.per_page_default
  end

  def show; end

  def new
    @chapter = @comic.chapters.build
    @picture = @chapter.pictures.build
  end

  def create
    @chapter = @comic.chapters.build chapter_params

    if @chapter.save
      flash[:success] = t ".success"
      redirect_to admin_comic_chapter_path(id: @chapter)
    else
      render :new
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit :name, pictures_attributes: [:picture]
  end

  def load_chapter
    return if (@chapter = Chapter.find_by id: params[:id])

    flash[:danger] = t "common.chapter_not_found"
    redirect_to admin_comics_url
  end

  def load_comic
    return if (@comic = Comic.find_by id: params[:comic_id])

    flash[:danger] = t "common.comic_not_found"
    redirect_to admin_comics_url
  end
end
