class Admin::CategoriesController < AdminController
  before_action :load_category, only: %i(show edit update destroy)

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by id: @category.id
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = t "admin.categories.add_succ"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "admin.categories.add_fails"
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "admin.categories.update_succ"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "admin.categories.dele_succ"
    else
      flash[:danger] = t "admin.categories.dele_fails"
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category

    flash[:danger] = t "common.comic_not_found"
    redirect_to admin_root_path
  end
end
