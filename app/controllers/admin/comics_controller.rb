class Admin::ComicsController < AdminController
  before_action :load_comic, only: %i(show edit update destroy)

  def index
    @comics = Comic.newly_create.page(params[:page])
                   .per Settings.comic.per_page
  end

  def show
    @category = Category.find_by id: @comic.category_id
    @chapters = @comic.chapters.recent_upload.page(params[:page])
                      .per Settings.chapter.per_page
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new comic_params

    if @comic.save
      flash[:success] = t ".success"
      redirect_to admin_comic_path(@comic)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @comic.update_attributes comic_params
      flash[:success] = t ".success"
      redirect_to admin_comics_path
    else
      flash.now[:danger] = t ".failed"
      render :edit
    end
  end

  def destroy
    if @comic.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to admin_comics_path
  end
  private

  def comic_params
    params.require(:comic).permit Comic::COMIC_ATTR
  end

  def load_comic
    @comic = Comic.find_by id: params[:id]
    return if @comic

    flash[:danger] = t "common.comic_not_found"
    redirect_to admin_root_path
  end
end
